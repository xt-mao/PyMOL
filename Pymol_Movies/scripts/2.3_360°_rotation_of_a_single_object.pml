#蛋白受体不动，仅配体360°旋转

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
#提取配体NAP
#create NAP,resn NAP
#show sticks,NAP
extract NAP,resn NAP
as sticks,resn NAP
#设置一个90帧的动画框架
mset 1x90
#重置视觉中心,并存储第1,90帧
orient
mview store, 1, object=NAP
mview store, 90, object=NAP
#逆时针旋转120°,并存储第30帧
# keyword >>object<< is absolutely necessary! Otherwise movie will not work.
frame 30
rotate y, 120, object=NAP
#再逆时针旋转120°,并存储第60帧
frame 60
rotate y, 120, object=NAP
#场景整合,可有可无
#mview reinterpolate
#播放
mplay
#停止
mstop

