#沿骨架顺序局部放大residues

#初始化
reinitialize
#设置一个储存对象的matrix_mode，一个电影时间线
set matrix_mode, 1
set movie_panel, 1

#载入1cll
fetch 1cll, async=0
#蛋白以line的形式展示
as lines, n. C+O+N+CA
#颜色
color marine
#重置视角
orient

#设置label
#字体格式，default=5
set label_font_id,7
#负值表示以埃为单位，当缩放label对象时，label与label对象的相对大小不会变化
set label_size,-0.5 
#字体大小
set label_size,20

##设置一个1480帧的动画框架
mset 1 x1480

#设置第1,20帧
mview store, 1
mview store, 20

#单字母标记aa
single ={'VAL':'V', 'ILE':'I', 'LEU':'L', 'GLU':'E', 'GLN':'Q', \
'ASP':'D', 'ASN':'N', 'HIS':'H', 'TRP':'W', 'PHE':'F', 'TYR':'Y', \
'ARG':'R', 'LYS':'K', 'SER':'S', 'THR':'T', 'MET':'M', 'ALA':'A', \
'GLY':'G', 'PRO':'P', 'CYS':'C'}
#设定特定帧的动作，第21帧label开始，第1421帧label结束
mappend 21:label 1cll and name ca,"%s%s"%(single[resn],resi)
mappend 1421:hide labels

#每隔10帧，沿着骨架顺序局部放大5个residues
python
for x in range(0,142,5):
  cmd.frame(10*(x+2)+1)
  cmd.zoom( "n. CA and i. " + str(x) + "+" + str(x+5))
  cmd.center( "n. CA and i. " + str(x) + "+" + str(x+5))
  cmd.mview("store")
python end

#最后一帧，局部返回整体
frame 1480
zoom
mview store

#将场景整合为一个
mview reinterpolate

#播放
mplay
