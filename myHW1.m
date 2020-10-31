%多媒體Hw1

tic %計時

root = dir('./CroppedYale\yaleB*'); %存取每個人的資料夾
sum_people = length(root);  %總共有38個人


for i = 1 : sum_people  % 1~38
    
    %fprintf("Reading image...: %d %d\n",i,sum_people);
    folder = dir(['./CroppedYale\', root(i).name, '\', '*.pgm*'] );
    num_image = length(folder) - 1; %刪除 *_Ambient.pgm這個檔
    
    for j = 1 : num_image
        
        img = imread(['CroppedYale\', root(i).name, '\', folder(j).name]);  %讀取圖片
        img_flatten = reshape(img, 192*168,1);  %因為img為192*168=32256，用img_flatten去reshape
        img_flatten = double(img_flatten(:));
        list(:, j, i) = img_flatten;
        
    end
end



count = 0;
correct_SAD = 0;
correct_SSD = 0;
 
%test image
for i = 1 : sum_people  %從第1人到第sum_people = 38人
    for j = 36 : num_image  %從36張~num_image(64張)開始為test
        
        test_rd = randperm(64);
        %fprintf("Processing the test image [%d] of person [%d]\n",j-35,i);
        min_sad = inf;      %將初始值設為inf(正無窮)
        min_ssd = inf;
        
        %train image，1~38每人35張為train
        for k = 1 : sum_people        
            
            for m = 1 : 35
                
                 train_rd = randperm(64);
                 % calculate nn sad and ssd              
                 sad = sum(abs(list(:, test_rd(i), i) - list(:, train_rd(m), k)));
                 ssd = sum((list(:, test_rd(i), i) - list(:, train_rd(m), k)).^2);
                 if sad < min_sad
                    min_sad = sad;
                    label1 = k;
                end
                
                if ssd < min_ssd
                    min_ssd = ssd;
                    label2 = k;
                end
                               
            end
                
        end

%         % compare min's label with the label of test image
%         % if match label correct++

        count = count + 1;
        
        if label1 == i
            correct_SAD = correct_SAD + 1;
        end
        
        if label2 == i
            correct_SSD = correct_SSD + 1;
        end
        
    end
    
end


accuracy_SAD = (correct_SAD / count) * 100;
accuracy_SSD = (correct_SSD / count) * 100;

%輸出結果
fprintf("SAD accuracy = %f\n",accuracy_SAD);
fprintf("SSD accuracy = %f\n",accuracy_SSD);

toc %計時結束