#比对

#初始化
reinitialize
#设置一个储存对象的matrix_mode，一个电影时间线
set matrix_mode, 1
set movie_panel, 1
#载入PDBs
fetch 1cll 1ggz, async=0

#loop半径
set cartoon_loop_radius,0.1
#使beta条带和loop沿骨架的正确路径延伸并给出更精确的结构描述
set cartoon_flat_sheets, 0
set cartoon_smooth_loops, 0
#helix的边上会带有一个很细的cylinder
set cartoon_fancy_helices,1
#此时设置helix的厚度，宽度，以及这个cylinder的半径
set cartoon_dumbbell_width,0.1
set cartoon_dumbbell_length,1.6
set cartoon_dumbbell_radius,0.1

#蛋白以cartoon形式展现
as cartoon
#重置视角
orient

##设置一个100帧的动画框架
mset 1 x100
#设置第1帧
#store the camera position and object
#positions in frame 1
frame 1
mview store
mview store, object=1cll
mview store, object=1ggz

#设置第90帧，align，zoom
frame 90
super 1cll, 1ggz
zoom
mview store
mview store, object=1cll
mview store, object=1ggz

#将场景整合为一个
mview reinterpolate
mview reinterpolate, object=1cll
mview reinterpolate, object=1ggz

#播放
mplay

#停止
mstop
