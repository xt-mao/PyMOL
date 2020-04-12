#放大binding pocket，查看附近

#初始化设置
reinitialize
set matrix_mode, 1
set movie_panel, 1
set scene_buttons, 1
set cache_frames, 1
config_mouse three_button_motions, 1

#载入1te1
fetch 1te1, async=0

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

#提取AB链
extract AA, c. A
extract BB, c. B
#设置AB链颜色
color marine, AA
color grey, BB
#设置AB链展示方式
as surface, BB
as cartoon, AA

#重置视角
orient

#设置一个100帧的动画框架
mset 1x100

#左上角显示向导信息
wizard message, "Can you see the blue protein inhibiting the gray protein?"

#场景1，主视角，1-10
frame 1
mview store
frame 5
mview store

#场景2，转换视角，放大结合部位，15-30
#设置视角
frame 15
set_view (\
     0.307660401,    0.011366921,    0.951428533,\
     0.930296898,   -0.213488042,   -0.298277378,\
     0.199727684,    0.976880252,   -0.076255992,\
     0.000000000,    0.000000000, -196.781448364,\
    27.129878998,   68.309677124,   51.827075958,\
   155.143981934,  238.418914795,  -20.000000000 )
mview store
select inhib, AA and i. 148-155
select none
mview store
#放大
frame 20
zoom inhib
mview store
#暂停
frame 30
mview store

#场景3，look around the binding pocket，30-60
frame 45
turn y, 150
mview store
frame 60
turn y, -150
mview store

#场景4，one more gratuitous view，60-90
frame 75
set_view (\
     0.943371952,    0.309539229,   -0.119302809,\
    -0.044248745,   -0.239008784,   -0.970008850,\
    -0.328769624,    0.920357347,   -0.211777285,\
     0.000000000,    0.000000000,  -30.773454666,\
    35.418403625,   72.805625916,   52.437019348,\
    20.233829498,   41.313076019,  -20.000000000 )
mview store
frame 90
mview store

#场景5，回到原视角，90-100

#场景整合
mview reinterpolate

#回到第1帧开始播放
frame 1
mplay