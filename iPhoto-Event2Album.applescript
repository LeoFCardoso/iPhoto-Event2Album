(* This script will create one album for each event in the current iPhoto Library 

Tested on iPhoto 9.6 - 910.29
Tested on iPhoto 9.6.1 - 910.42

All event names *MUST* be UNIQUE!!

Please check this condition with following query on sqlite database

select F.name, count ( * )
from RKFolder F 
where (F.name <> "") and (F.folderType = 2) 
and (F.parentFolderUuid = "AllProjectsItem") 
group by F.name
having count ( * ) > 1
order by F.name

USE AT YOUR OWN RISK!
USE AT YOUR OWN RISK!
USE AT YOUR OWN RISK!

*)

property defaultPrefixAlbum : "#" -- Albuns will be (re)created using this prefix. Adjust to your needs.
property ignoreExisting : false -- if true will ignore existing albuns (do nothing), if false will rebuild (delete / recreate) albuns from corresponding events
property iPhotoLibraryDB : "sqlite3 /Users/leonardo/Pictures/Biblioteca\\ iPhoto.photolibrary/Database/Library.apdb " -- Adjust to your path

-- This is last event correctly transformed to album. Use it to restart processing. sqlQueryEvents MUST use correct "order by" clause to work...
-- Use "" (empty string) to switch off this mode
property lastSucessfulEvent : "2015-02-Laura Pirata"

tell application "iPhoto"
	
	-- *TODO* - create a mode to remove all albuns starting with "defaultPrefixAlbum"
	
	-- remove limit clause below to process all events
	set sqlQueryEvents to "'select F.uuid, F.name from RKFolder F where (F.name <> \"\") and (F.folderType = 2) and (F.parentFolderUuid = \"AllProjectsItem\") order by F.name limit 1000;'"
	-- use this query to debug some specific event
	-- set sqlQueryEvents to "'select F.uuid, F.name from RKFolder F where (F.name like \"%1981-08-Anivers‡rio Leo 4 anos%\") and (F.folderType = 2) and (F.parentFolderUuid = \"AllProjectsItem\") order by F.name limit 1;'"
	
	set eventsList to do shell script iPhotoLibraryDB & sqlQueryEvents
	set eventsList to every paragraph in eventsList
	-- log eventsList
	
	repeat with processEvent in eventsList -- will iterate through all events in Library
		--log processEvent
		set AppleScript's text item delimiters to "|"
		set processEvent to every text item in processEvent
		set AppleScript's text item delimiters to ""
		set theEventUUID to item 1 of processEvent
		--log theEventUUID
		set theEvent to item 2 of processEvent
		--log theEvent
		set theCorrespondingAlbum to defaultPrefixAlbum & theEvent
		log (time string of (current date)) & " - Processing " & theCorrespondingAlbum & "..."
		
		if (theEvent ² lastSucessfulEvent) then
			log (time string of (current date)) & " - Ignoring " & theCorrespondingAlbum & ", because value of last successful event..."
			
		else
			
			if (exists album theCorrespondingAlbum) and (ignoreExisting) then
				log (time string of (current date)) & " - Ignoring " & theCorrespondingAlbum & ", because it already exists..."
				
			else
				
				repeat --remove all albuns with same name
					if (exists album theCorrespondingAlbum) then remove album theCorrespondingAlbum
					if not (exists album theCorrespondingAlbum) then exit repeat
				end repeat
				
				log (time string of (current date)) & " - Creating " & theCorrespondingAlbum & "..."
				new album name theCorrespondingAlbum
				
				-- 4294967296 is 2^32 - it's a pointer from sqlite ids to applescript ids. Found this "formula" on Internet forums and apparently works.
				-- this inner query seems to slow down processing. Need refactor.
				set sqlQueryPhotos to "'select (V.modelId + 4294967296) as photoId from RKMaster M, RKVersion V where (M.modelId = V.masterId) and (M.projectUuid = \"" & theEventUUID & "\")  and (M.isMissing = 0) and (M.isInTrash = 0) and (V.isInTrash = 0) and (V.showInLibrary = 1) and (V.versionNumber = (select max(V2.versionNumber) from RKVersion V2 where V2.masterId = M.modelId)) order by M.imageDate;'"
				-- log sqlQueryPhotos
				set idList to do shell script iPhotoLibraryDB & sqlQueryPhotos
				set photoIdList to every paragraph in idList
				
				-- this code seems to be slow. Need refactor.
				repeat with currentPhotoID in photoIdList
					try
						set currentPhoto to (get photo id (currentPhotoID as integer))
						add currentPhoto to album theCorrespondingAlbum
					on error the error_message number the error_number
						-- Something goes wrong. User should read error messages and correct the situation or the script itself. 
						log (time string of (current date)) & " - ERROR: " & the error_number & ". " & the error_message
					end try
					
				end repeat
			end if
		end if
	end repeat
end tell

