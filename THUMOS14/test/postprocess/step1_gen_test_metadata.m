%clear;

frmdir = '/S2/MI/project/action_detection/data/thumos14/frame/test/';
bindir = '/S2/MI/jbr/CDC/THUMOS14/predata/test/window/';

folder = dir(frmdir); 
binfolder = dir(bindir);

videoid = zeros(42124*32,1); % 36182*32=1157824
frmid = zeros(42124*32,1);
kept_frm_index = zeros(42124*32,1);

count = 0;
index = 0;
for folder_index = 3:size(folder,1)
    folder_index
    img = dir( [frmdir folder(folder_index).name '/*jpg'] );
    bin = dir( [bindir binfolder(folder_index).name '/*bin'] );
    tmp = strsplit(folder(folder_index).name,'_');
    videoid((count+1):(count+size(img,1))) = str2num(tmp{end});
    frmid((count+1):(count+size(img,1))) = 1:size(img,1);
    kept_frm_index((count+1):(count+32*(size(bin,1)-1))) = (index+1):(index+32*(size(bin,1)-1));
    kept_frm_index(((count+32*(size(bin,1)-1))+1):(count+size(img,1))) ... 
        = ((index+32*size(bin,1)+32*(size(bin,1)-1))+1-size(img,1)):(index+32*size(bin,1));
    count = count + size(img,1);
    index = index + 32*size(bin,1);
end  
               

videoid = videoid(1:count); % 36182*32=1157824
frmid = frmid(1:count);
kept_frm_index = kept_frm_index(1:count); 
max(kept_frm_index)

save('metadata.mat','videoid','frmid','kept_frm_index');



                    
