#远离，结合，远离

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

#设置视角
set_view (\
     0.423117876,    0.061672822,    0.903973043,\
     0.789699256,   -0.514252067,   -0.334546506,\
     0.444237947,    0.855418444,   -0.266292989,\
     0.000107866,   -0.000027858, -196.784057617,\
    28.171787262,   70.919288635,   52.095287323,\
   155.143981934,  238.418914795,  -20.000000000 )

#移走inhibitor
translate [0,0,100], object=AA

#设置一个410帧的动画框架
mset 1 x100
#左上角显示向导信息
wizard message, "Let's watch the binder float it, while the camera doesn't move."

#场景1，grayprotein，1-20
frame 1
mview store, object=AA
mview store, object=BB

#场景2，inhibitor从远及近结合，20-60
frame 20
mview store, object=AA
mview store, object=BB
frame 60
translate [0,0,-100], object=AA
mview store, object=AA
mview interpolate, object=AA

#场景3，暂停一会，60-80
frame 80
mview store, object=AA
mview store, object=BB
mview reinterpolate, object=AA
mview reinterpolate, object=BB


#场景4，'explode' apart，80-100
frame 100
translate [-70, 70, 70], object=AA
translate [70, -70, -70], object=BB
mview store, object=AA
mview store, object=BB

#场景整合
mview reinterpolate, object=AA
mview reinterpolate, object=BB

#回到第1帧开始播放
frame 1
mplay
