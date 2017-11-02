#arg1 network model
#arg2 trained parameters
#arg3 GPU ID
#arg4 batch size
#arg5 number of mini batches
#arg6 outpu file prefix

GLOG_logtosterr=1 ../CDC/build/tools/extract_image_features.bin \
                  xfeat.prototxt \
                  ../model/thumos_CDC/convdeconv-TH14_iter_24390 \
                  1 \
                  6 \
                  1 \
                  prefix.lst feat \
