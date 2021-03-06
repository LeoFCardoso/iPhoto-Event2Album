FasdUAS 1.101.10   ��   ��    k             l      ��  ��   � This script will create one album for each event in the current iPhoto Library 

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

     � 	 	�   T h i s   s c r i p t   w i l l   c r e a t e   o n e   a l b u m   f o r   e a c h   e v e n t   i n   t h e   c u r r e n t   i P h o t o   L i b r a r y   
 
 T e s t e d   o n   i P h o t o   9 . 6   -   9 1 0 . 2 9 
 T e s t e d   o n   i P h o t o   9 . 6 . 1   -   9 1 0 . 4 2 
 
 A l l   e v e n t   n a m e s   * M U S T *   b e   U N I Q U E ! ! 
 
 P l e a s e   c h e c k   t h i s   c o n d i t i o n   w i t h   f o l l o w i n g   q u e r y   o n   s q l i t e   d a t a b a s e 
 
 s e l e c t   F . n a m e ,   c o u n t   (   *   ) 
 f r o m   R K F o l d e r   F   
 w h e r e   ( F . n a m e   < >   " " )   a n d   ( F . f o l d e r T y p e   =   2 )   
 a n d   ( F . p a r e n t F o l d e r U u i d   =   " A l l P r o j e c t s I t e m " )   
 g r o u p   b y   F . n a m e 
 h a v i n g   c o u n t   (   *   )   >   1 
 o r d e r   b y   F . n a m e 
 
 U S E   A T   Y O U R   O W N   R I S K ! 
 U S E   A T   Y O U R   O W N   R I S K ! 
 U S E   A T   Y O U R   O W N   R I S K ! 
 
   
  
 l     ��������  ��  ��        l          j     �� �� (0 defaultprefixalbum defaultPrefixAlbum  m        �    #  J D Albuns will be (re)created using this prefix. Adjust to your needs.     �   �   A l b u n s   w i l l   b e   ( r e ) c r e a t e d   u s i n g   t h i s   p r e f i x .   A d j u s t   t o   y o u r   n e e d s .      l          j    �� ��  0 ignoreexisting ignoreExisting  m    ��
�� boovfals  � } if true will ignore existing albuns (do nothing), if false will rebuild (delete / recreate) albuns from corresponding events     �   �   i f   t r u e   w i l l   i g n o r e   e x i s t i n g   a l b u n s   ( d o   n o t h i n g ) ,   i f   f a l s e   w i l l   r e b u i l d   ( d e l e t e   /   r e c r e a t e )   a l b u n s   f r o m   c o r r e s p o n d i n g   e v e n t s      l           j    �� !�� "0 iphotolibrarydb iPhotoLibraryDB ! m     " " � # # � s q l i t e 3   / U s e r s / l e o n a r d o / P i c t u r e s / B i b l i o t e c a \   i P h o t o . p h o t o l i b r a r y / D a t a b a s e / L i b r a r y . a p d b      Adjust to your path      � $ $ (   A d j u s t   t o   y o u r   p a t h   % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) � � This is last event correctly transformed to album. Use it to restart processing. sqlQueryEvents MUST use correct "order by" clause to work...    * � + +   T h i s   i s   l a s t   e v e n t   c o r r e c t l y   t r a n s f o r m e d   t o   a l b u m .   U s e   i t   t o   r e s t a r t   p r o c e s s i n g .   s q l Q u e r y E v e n t s   M U S T   u s e   c o r r e c t   " o r d e r   b y "   c l a u s e   t o   w o r k . . . (  , - , l     �� . /��   . 4 . Use "" (empty string) to switch off this mode    / � 0 0 \   U s e   " "   ( e m p t y   s t r i n g )   t o   s w i t c h   o f f   t h i s   m o d e -  1 2 1 j   	 �� 3�� (0 lastsucessfulevent lastSucessfulEvent 3 m   	 
 4 4 � 5 5 ( 2 0 1 5 - 0 2 - L a u r a   P i r a t a 2  6 7 6 l     ��������  ��  ��   7  8 9 8 l   � :���� : O    � ; < ; k   � = =  > ? > l   ��������  ��  ��   ?  @ A @ l   �� B C��   B U O *TODO* - create a mode to remove all albuns starting with "defaultPrefixAlbum"    C � D D �   * T O D O *   -   c r e a t e   a   m o d e   t o   r e m o v e   a l l   a l b u n s   s t a r t i n g   w i t h   " d e f a u l t P r e f i x A l b u m " A  E F E l   ��������  ��  ��   F  G H G l   �� I J��   I 6 0 remove limit clause below to process all events    J � K K `   r e m o v e   l i m i t   c l a u s e   b e l o w   t o   p r o c e s s   a l l   e v e n t s H  L M L r     N O N m     P P � Q Q8 ' s e l e c t   F . u u i d ,   F . n a m e   f r o m   R K F o l d e r   F   w h e r e   ( F . n a m e   < >   " " )   a n d   ( F . f o l d e r T y p e   =   2 )   a n d   ( F . p a r e n t F o l d e r U u i d   =   " A l l P r o j e c t s I t e m " )   o r d e r   b y   F . n a m e   l i m i t   1 0 0 0 ; ' O o      ����  0 sqlqueryevents sqlQueryEvents M  R S R l   �� T U��   T 2 , use this query to debug some specific event    U � V V X   u s e   t h i s   q u e r y   t o   d e b u g   s o m e   s p e c i f i c   e v e n t S  W X W l   �� Y Z��   Y � � set sqlQueryEvents to "'select F.uuid, F.name from RKFolder F where (F.name like \"%1981-08-Anivers�rio Leo 4 anos%\") and (F.folderType = 2) and (F.parentFolderUuid = \"AllProjectsItem\") order by F.name limit 1;'"    Z � [ [�   s e t   s q l Q u e r y E v e n t s   t o   " ' s e l e c t   F . u u i d ,   F . n a m e   f r o m   R K F o l d e r   F   w h e r e   ( F . n a m e   l i k e   \ " % 1 9 8 1 - 0 8 - A n i v e r s a r i o   L e o   4   a n o s % \ " )   a n d   ( F . f o l d e r T y p e   =   2 )   a n d   ( F . p a r e n t F o l d e r U u i d   =   \ " A l l P r o j e c t s I t e m \ " )   o r d e r   b y   F . n a m e   l i m i t   1 ; ' " X  \ ] \ l   ��������  ��  ��   ]  ^ _ ^ r     ` a ` I   �� b��
�� .sysoexecTEXT���     TEXT b b     c d c o    ���� "0 iphotolibrarydb iPhotoLibraryDB d o    ����  0 sqlqueryevents sqlQueryEvents��   a o      ���� 0 
eventslist 
eventsList _  e f e r     g h g n    i j i 2    ��
�� 
cpar j o    ���� 0 
eventslist 
eventsList h o      ���� 0 
eventslist 
eventsList f  k l k l   �� m n��   m   log eventsList    n � o o    l o g   e v e n t s L i s t l  p q p l   ��������  ��  ��   q  r�� r X   � s�� t s l  ,� u v w u k   ,� x x  y z y l  , ,�� { |��   {  log processEvent    | � } }   l o g   p r o c e s s E v e n t z  ~  ~ r   , 1 � � � m   , - � � � � �  | � n      � � � 1   . 0��
�� 
txdl � 1   - .��
�� 
ascr   � � � r   2 7 � � � n  2 5 � � � 2   3 5��
�� 
citm � o   2 3���� 0 processevent processEvent � o      ���� 0 processevent processEvent �  � � � r   8 = � � � m   8 9 � � � � �   � n      � � � 1   : <��
�� 
txdl � 1   9 :��
�� 
ascr �  � � � r   > D � � � n   > B � � � 4   ? B�� �
�� 
cobj � m   @ A����  � o   > ?���� 0 processevent processEvent � o      ���� 0 theeventuuid theEventUUID �  � � � l  E E�� � ���   �  log theEventUUID    � � � �   l o g   t h e E v e n t U U I D �  � � � r   E K � � � n   E I � � � 4   F I�� �
�� 
cobj � m   G H����  � o   E F���� 0 processevent processEvent � o      ���� 0 theevent theEvent �  � � � l  L L�� � ���   �  log theEvent    � � � �  l o g   t h e E v e n t �  � � � r   L W � � � b   L S � � � o   L Q���� (0 defaultprefixalbum defaultPrefixAlbum � o   Q R���� 0 theevent theEvent � o      ���� .0 thecorrespondingalbum theCorrespondingAlbum �  � � � I  X q�� ���
�� .ascrcmnt****      � **** � b   X m � � � b   X i � � � b   X e � � � l  X a ����� � n   X a � � � 1   ] a��
�� 
tstr � l  X ] ����� � I  X ]������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��   � m   a d � � � � �    -   P r o c e s s i n g   � o   e h���� .0 thecorrespondingalbum theCorrespondingAlbum � m   i l � � � � �  . . .��   �  � � � l  r r��������  ��  ��   �  ��� � Z   r� � ��� � � l  r y ����� � B   r y � � � o   r s���� 0 theevent theEvent � o   s x���� (0 lastsucessfulevent lastSucessfulEvent��  ��   � k   | � � �  � � � I  | ��� ���
�� .ascrcmnt****      � **** � b   | � � � � b   | � � � � b   | � � � � l  | � ����� � n   | � � � � 1   � ���
�� 
tstr � l  | � ����� � I  | �������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��   � m   � � � � � � �    -   I g n o r i n g   � o   � ����� .0 thecorrespondingalbum theCorrespondingAlbum � m   � � � � � � � V ,   b e c a u s e   v a l u e   o f   l a s t   s u c c e s s f u l   e v e n t . . .��   �  ��� � l  � ���������  ��  ��  ��  ��   � k   �� � �  � � � l  � ���������  ��  ��   �  ��� � Z   �� � ��� � � F   � � � � � l  � � ����� � I  � ��� ���
�� .coredoexbool       obj  � 4   � ��� �
�� 
ipal � o   � ����� .0 thecorrespondingalbum theCorrespondingAlbum��  ��  ��   � l  � � ����� � o   � �����  0 ignoreexisting ignoreExisting��  ��   � k   � � � �  � � � I  � ��� ���
�� .ascrcmnt****      � **** � b   � � � � � b   � � � � � b   � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
tstr � l  � � ����� � I  � �������
�� .misccurdldt    ��� null��  ��  ��  ��  ��  ��   � m   � � � � � � �    -   I g n o r i n g   � o   � ��� .0 thecorrespondingalbum theCorrespondingAlbum � m   � � � � � � � < ,   b e c a u s e   i t   a l r e a d y   e x i s t s . . .��   �  ��~ � l  � ��}�|�{�}  �|  �{  �~  ��   � k   �� � �    l  � ��z�y�x�z  �y  �x    T   � l  � k   � 	
	 Z  � ��w�v l  � ��u�t I  � ��s�r
�s .coredoexbool       obj  4   � ��q
�q 
ipal o   � ��p�p .0 thecorrespondingalbum theCorrespondingAlbum�r  �u  �t   I  � ��o�n
�o .iPhoremvnull���    obj  4   � ��m
�m 
ipal o   � ��l�l .0 thecorrespondingalbum theCorrespondingAlbum�n  �w  �v  
 �k Z  ��j�i H   � l  ��h�g I  ��f�e
�f .coredoexbool       obj  4   � �d
�d 
ipal o   � ��c�c .0 thecorrespondingalbum theCorrespondingAlbum�e  �h  �g    S  	�j  �i  �k   &  remove all albuns with same name    � @ r e m o v e   a l l   a l b u n s   w i t h   s a m e   n a m e  l �b�a�`�b  �a  �`    I ,�_�^
�_ .ascrcmnt****      � **** b  (  b  $!"! b   #$# l %�]�\% n  &'& 1  �[
�[ 
tstr' l (�Z�Y( I �X�W�V
�X .misccurdldt    ��� null�W  �V  �Z  �Y  �]  �\  $ m  )) �**    -   C r e a t i n g  " o   #�U�U .0 thecorrespondingalbum theCorrespondingAlbum  m  $'++ �,,  . . .�^   -.- I -8�T�S/
�T .iPhoinalipal    ��� null�S  / �R0�Q
�R 
pnam0 o  14�P�P .0 thecorrespondingalbum theCorrespondingAlbum�Q  . 121 l 99�O�N�M�O  �N  �M  2 343 l 99�L56�L  5 � � 4294967296 is 2^32 - it's a pointer from sqlite ids to applescript ids. Found this "formula" on Internet forums and apparently works.   6 �77   4 2 9 4 9 6 7 2 9 6   i s   2 ^ 3 2   -   i t ' s   a   p o i n t e r   f r o m   s q l i t e   i d s   t o   a p p l e s c r i p t   i d s .   F o u n d   t h i s   " f o r m u l a "   o n   I n t e r n e t   f o r u m s   a n d   a p p a r e n t l y   w o r k s .4 898 l 99�K:;�K  : E ? this inner query seems to slow down processing. Need refactor.   ; �<< ~   t h i s   i n n e r   q u e r y   s e e m s   t o   s l o w   d o w n   p r o c e s s i n g .   N e e d   r e f a c t o r .9 =>= r  9F?@? b  9BABA b  9>CDC m  9<EE �FF � ' s e l e c t   ( V . m o d e l I d   +   4 2 9 4 9 6 7 2 9 6 )   a s   p h o t o I d   f r o m   R K M a s t e r   M ,   R K V e r s i o n   V   w h e r e   ( M . m o d e l I d   =   V . m a s t e r I d )   a n d   ( M . p r o j e c t U u i d   =   "D o  <=�J�J 0 theeventuuid theEventUUIDB m  >AGG �HH� " )     a n d   ( M . i s M i s s i n g   =   0 )   a n d   ( M . i s I n T r a s h   =   0 )   a n d   ( V . i s I n T r a s h   =   0 )   a n d   ( V . s h o w I n L i b r a r y   =   1 )   a n d   ( V . v e r s i o n N u m b e r   =   ( s e l e c t   m a x ( V 2 . v e r s i o n N u m b e r )   f r o m   R K V e r s i o n   V 2   w h e r e   V 2 . m a s t e r I d   =   M . m o d e l I d ) )   o r d e r   b y   M . i m a g e D a t e ; '@ o      �I�I  0 sqlqueryphotos sqlQueryPhotos> IJI l GG�HKL�H  K   log sqlQueryPhotos   L �MM &   l o g   s q l Q u e r y P h o t o sJ NON r  GXPQP I GT�GR�F
�G .sysoexecTEXT���     TEXTR b  GPSTS o  GL�E�E "0 iphotolibrarydb iPhotoLibraryDBT o  LO�D�D  0 sqlqueryphotos sqlQueryPhotos�F  Q o      �C�C 0 idlist idListO UVU r  YbWXW n Y^YZY 2  \^�B
�B 
cparZ o  Y\�A�A 0 idlist idListX o      �@�@ 0 photoidlist photoIdListV [\[ l cc�?�>�=�?  �>  �=  \ ]^] l cc�<_`�<  _ 1 + this code seems to be slow. Need refactor.   ` �aa V   t h i s   c o d e   s e e m s   t o   b e   s l o w .   N e e d   r e f a c t o r .^ b�;b X  c�c�:dc k  u�ee fgf Q  u�hijh k  x�kk lml r  x�non l x�p�9�8p e  x�qq 5  x��7r�6
�7 
ipmrr l |�s�5�4s c  |�tut o  |}�3�3  0 currentphotoid currentPhotoIDu m  }��2
�2 
long�5  �4  
�6 kfrmID  �9  �8  o o      �1�1 0 currentphoto currentPhotom v�0v I ���/wx
�/ .iPhoiaddnull���    obj w o  ���.�. 0 currentphoto currentPhotox �-y�,
�- 
to  y 4  ���+z
�+ 
ipalz o  ���*�* .0 thecorrespondingalbum theCorrespondingAlbum�,  �0  i R      �){|
�) .ascrerr ****      � ****{ l     }�(�'} o      �&�& 0 error_message  �(  �'  | �%~�$
�% 
errn~ l     �#�" o      �!�! 0 error_number  �#  �"  �$  j k  ���� ��� l ��� ���   � m g Something goes wrong. User should read error messages and correct the situation or the script itself.    � ��� �   S o m e t h i n g   g o e s   w r o n g .   U s e r   s h o u l d   r e a d   e r r o r   m e s s a g e s   a n d   c o r r e c t   t h e   s i t u a t i o n   o r   t h e   s c r i p t   i t s e l f .  � ��� I �����
� .ascrcmnt****      � ****� b  ����� b  ����� b  ����� b  ����� l ������ n  ����� 1  ���
� 
tstr� l ������ I �����
� .misccurdldt    ��� null�  �  �  �  �  �  � m  ���� ���    -   E R R O R :  � l ������ o  ���� 0 error_number  �  �  � m  ���� ���  .  � l ������ o  ���� 0 error_message  �  �  �  �  g ��� l ������  �  �  �  �:  0 currentphotoid currentPhotoIDd o  fi�
�
 0 photoidlist photoIdList�;  ��  ��   v 1 + will iterate through all events in Library    w ��� V   w i l l   i t e r a t e   t h r o u g h   a l l   e v e n t s   i n   L i b r a r y�� 0 processevent processEvent t o     �	�	 0 
eventslist 
eventsList��   < m     ���                                                                                  iPho  alis    H  
Leo Mac HD                 ���H+  �`'
iPhoto.app                                                     ���-�        ����  	                Applications    ��.�      �-,�    �`'  #Leo Mac HD:Applications: iPhoto.app    
 i P h o t o . a p p   
 L e o   M a c   H D  Applications/iPhoto.app   / ��  ��  ��   9 ��� l     ����  �  �  � ��� l     ����  �  �  �       �� �  " 4��  � ������������ (0 defaultprefixalbum defaultPrefixAlbum��  0 ignoreexisting ignoreExisting�� "0 iphotolibrarydb iPhotoLibraryDB�� (0 lastsucessfulevent lastSucessfulEvent
�� .aevtoappnull  �   � ****
�  boovfals� �����������
�� .aevtoappnull  �   � ****� k    ���  8����  ��  ��  � ���������� 0 processevent processEvent��  0 currentphotoid currentPhotoID�� 0 error_message  �� 0 error_number  � 1� P�������������� ������� ����������� � ��� � ������� � ���)+����EG�������������������������  0 sqlqueryevents sqlQueryEvents
�� .sysoexecTEXT���     TEXT�� 0 
eventslist 
eventsList
�� 
cpar
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
ascr
�� 
txdl
�� 
citm�� 0 theeventuuid theEventUUID�� 0 theevent theEvent�� .0 thecorrespondingalbum theCorrespondingAlbum
�� .misccurdldt    ��� null
�� 
tstr
�� .ascrcmnt****      � ****
�� 
ipal
�� .coredoexbool       obj 
�� 
bool
�� .iPhoremvnull���    obj 
�� 
pnam
�� .iPhoinalipal    ��� null��  0 sqlqueryphotos sqlQueryPhotos�� 0 idlist idList�� 0 photoidlist photoIdList
�� 
ipmr
�� 
long
�� kfrmID  �� 0 currentphoto currentPhoto
�� 
to  
�� .iPhoiaddnull���    obj �� 0 error_message  � ������
�� 
errn�� 0 error_number  ��  ������E�Ob  �%j E�O��-E�O��[��l kh  ���,FO��-E�O���,FO��k/E�O��l/E�Ob   �%E` O*j a ,a %_ %a %j O�b    *j a ,a %_ %a %j OPY-*a _ /j 	 b  a &  *j a ,a %_ %a %j OPY � >hZ*a _ /j  *a _ /j Y hO*a _ /j  Y h[OY��O*j a ,a %_ %a %j O*a  _ l !Oa "�%a #%E` $Ob  _ $%j E` %O_ %�-E` &O a_ &[��l kh  **a '�a (&a )0EE` *O_ *a +*a _ /l ,W  X - .*j a ,a /%�%a 0%�%j OP[OY��[OY�aU ascr  ��ޭ