#配体结合

#初始化
reinitialize
#关闭自动存储
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
#设置视角
set_view (\
  0.510788679,   -0.492003649,   -0.705003619,\
  0.541609228,    0.821011603,   -0.180557981,\
  0.667650938,   -0.289606541,    0.685831964,\
  0.000277460,    0.000008006, -158.140594482,\
 32.277400970,   46.861553192,   12.908380508,\
129.134155273,  187.140991211,  -20.000000000 )
#设置一个60帧的动画框架
mset 1x60
#配体X轴向右平移10,存储为第1帧
translate [10, 0, 0], object=ligand
mview store, 1, object=ligand
#配体X轴再向左平移10,存储为第60帧
translate [-10, 0, 0], object=ligand
mview store, 60, object=ligand 
#播放
mplay
#停止
mstop
