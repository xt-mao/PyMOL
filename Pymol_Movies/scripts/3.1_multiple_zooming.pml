#多重缩放
# At 30 FPS this is then a 16 second movie.
# We look at the structure for 2 seconds, zoom in to each ligand
# and look at it for another 2 seconds, then, zoom out and look again
# at everything for another 2 seconds.

#初始化
reinitialize
#载入2jep
fetch 2jep, async=0
#去除水分子
remove resn HOH

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

#重置视觉中心
orient
#选择三条链上的不同的配体
select l1, c. A and i. 1397
select l2, c. A and i. 1396
select l3, c. B and i. 1396
select none
#整个蛋白以cartoon形式展现
as cartoon
#非标准原子基团展示为sticks，颜色为绿色
show sticks, het
color magnesium, het

#设置视角
set_view (\
     0.998926699,   -0.001566750,    0.046291545,\
     0.028858602,    0.802784681,   -0.595570326,\
    -0.036229026,    0.596267045,    0.801968277,\
    -0.000011072,    0.000001046, -272.120849609,\
    46.975399017,    6.359184742,   14.787260056,\
   219.752426147,  324.489135742,  -20.000000000 )

#设置一个480帧的动画框架
mset 1 x480
#场景1，从第1帧到第60帧，界面显示为当前界面，2s
frame 1
mview store
frame 60
mview store

#场景2，视觉中心转化为ligand1，停滞2秒
frame 120
zoom l1
mview store
frame 180
mview store

#场景3，视觉中心移动至ligand2，停滞2秒
frame 240
zoom l2
mview store
frame 300
mview store

#场景4，视觉中心移动至ligand3，停滞2秒
frame 360
zoom l3
mview store
frame 420
mview store

#场景5，视觉中心移动到整体，2s
frame 480
zoom
mview store

#播放
mplay

#停止
mstop
