clear all;
dataDir = './data/Category A';
outDir = './Dehazed_Images/Category A';


f_lst = [];
f_lst = [f_lst; dir(fullfile(dataDir, '*.jpg'))];

for f_iter = 1:numel(f_lst)
%         disp(f_iter);
        f_info = f_lst(f_iter);
        if f_info.name == '.'
            continue;
        end
        f_path = fullfile(dataDir,f_info.name);
        haze = im2double(imread(f_path));
        dehaze = run_cnn(haze);
%         imshow(dehaze);
        o_file = fullfile(outDir,f_info.name);
        imwrite(dehaze,o_file,'jpg');

end

