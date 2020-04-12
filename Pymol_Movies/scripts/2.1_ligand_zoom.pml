#配体缩放，即整体展示-局部放大-返回整体

#初始化
reinitialize
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

#蛋白受体显示方式为cartoon
as cartoon
#小分子配体显示方式为sticks
as sticks,resn NAP
#设置一个60帧的动画框架
mset 1x60
#重置视觉中心,并存储第1,70帧
orient
mview store, 1
mview store, 60
#场景转换,视觉中心为配体分子,存储第20，50帧
orient resn NAP
mview store, 20
mview store, 30
#播放
mplay
#停止
mstop
