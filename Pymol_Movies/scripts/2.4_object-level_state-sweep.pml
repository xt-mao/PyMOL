#不同states转变

#初始化
reinitialize
#载入morph的30种states
load http://pymol.org/tmp/morph.pdb.gz

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
#螺旋和sheets的反面与正面颜色不同
set cartoon_highlight_color,grey70
#设置CNPO颜色
color gray90,symbol c
color plutonium,symbol n
color yelloworange,symbol p
color meitnerium,symbol o

#设置一个80帧的动画框架
mset 1x80
#存储第1帧,state为1
mview store, 1, object=m, state=1
#存储第30帧,state为30
mview store, 30, object=m, state=30
#存储第50帧,state为30
mview store, 50, object=m, state=30
#存储第80帧,state为1
mview store, 80, object=m, state=1
#播放
mplay
#停止
mstop

