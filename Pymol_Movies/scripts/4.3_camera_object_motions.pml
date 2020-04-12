#inhibitor从远及近结合，放大binding pocket，wiggle the inhibitor，look around the binding pocket，'explode' apart

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
set cartoon_loop_radius,0.15
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

#设置一个60帧的动画框架
mset 1 x60

#场景1，inhibitor从远及近结合，0-20
frame 1
mview store
mview store, object=AA
mview store, object=BB

#场景2，zoom，20-60
frame 20
translate [0,0,-100], object=AA
mview store
mview store, object=AA
frame 60
set_view (\
     0.993863702,    0.110482253,   -0.005255031,\
     0.054543663,   -0.530888498,   -0.845684826,\
    -0.096224494,    0.840209842,   -0.533656776,\
     0.000000000,    0.000000000,  -50.366786957,\
    34.781314850,   71.208221436,   52.535022736,\
    39.709556580,   61.024017334,  -20.000000000 )
mview store
mview store, object=AA
mview store, object=BB


#场景3，wiggle the inhibitor, like it's trying to escape，60-180
python
for x in range(20):
  cmd.madd("1 x3"); cmd.frame(1000);
  cmd.set_view("\
     0.993863702,    0.110482253,   -0.005255031,\
     0.054543663,   -0.530888498,   -0.845684826,\
    -0.096224494,    0.840209842,   -0.533656776,\
     0.000000000,    0.000000000,  -50.366786957,\
    34.781314850,   71.208221436,   52.535022736,\
    39.709556580,   61.024017334,  -20.000000000")  
  cmd.rotate("x", 1.0, object="AA")
  cmd.mview("store", object="AA")
  cmd.mview("store")
  cmd.mview("interpolate", object="AA")
  cmd.mview("reinterpolate")

  cmd.madd("1 x3"); cmd.frame(1000);
  cmd.set_view("\
     0.993863702,    0.110482253,   -0.005255031,\
     0.054543663,   -0.530888498,   -0.845684826,\
    -0.096224494,    0.840209842,   -0.533656776,\
     0.000000000,    0.000000000,  -50.366786957,\
    34.781314850,   71.208221436,   52.535022736,\
    39.709556580,   61.024017334,  -20.000000000")   
  cmd.rotate("x", -1.0, object="AA")
  cmd.mview("store", object="AA")
  cmd.mview("store")
  cmd.mview("interpolate", object="AA")
  cmd.mview("reinterpolate")
python end

mview store

#增加120帧
madd 1 x120

#场景4，look around the binding pocket，180-240
frame 180
mview store
mview store, object=AA
mview store, object=BB
frame 210
turn y, 90
mview store
mview store, object=AA
mview store, object=BB
frame 240
turn y, -90
mview store
mview store, object=AA
mview store, object=BB

#场景5，回到主视角，240-270
frame 270
set_view (\
     0.416044176,    0.142909154,    0.898038328,\
     0.795956194,   -0.534771442,   -0.283653021,\
     0.439722151,    0.832813382,   -0.336245179,\
     0.000014815,   -0.000003826, -162.395965576,\
    34.423114777,   72.546546936,   52.390083313,\
   147.584854126,  177.206466675,  -20.000000000 )
mview store
mview store, object=AA
mview store, object=BB

#场景6，'explode' apart，270-300
frame 300
translate [-70, 70, 70], object=AA
translate [70, -70, -70], object=BB
mview store
mview store, object=AA
mview store, object=BB

#回到第1帧开始播放
frame 1
mplay
