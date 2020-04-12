#场景转换

#初始化
reinitialize
set movie_auto_store, 0
#载入1rx1
fetch 1rx1, async=0

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

#提取配体
extract ligand,resn NAP
#设置受体配体展示方式
as cartoon, 1rx1
as sticks, ligand
#重置视角
orient
#存储场景1_graycartoon
scene graycartoon, store
#设置并存储场景2_graysurface
color gray90, 1rx1
show surface, 1rx1
turn y, 180
scene graysurface,store
#设置一个60帧的动画框架
mset 1x60
#设置第1帧为场景1
mview store, 1, scene=graycartoon
设置第30帧为场景2
mview store, 30, scene=graysurface
#播放
mplay
#停止
mstop
