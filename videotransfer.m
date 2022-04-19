t=1:0.1:10;
path="cat.mp4";
eof=false

%write video
v = VideoWriter('cats2.avi');
v.FrameRate = 1;
open(v);
bpskModulator = comm.BPSKModulator;
errorRate = comm.ErrorRate;
bpskDemodulator = comm.BPSKDemodulator;
for time = t
    %get video frame from file
    vidObj = VideoReader(path);
    vidObj.CurrentTime=time;
    frame = readFrame(vidObj);
    %imshow(frame);
    frame=imresize(frame,[64 64]);
    % imshow(frame);
    size(frame);
    image= frame;
    % while(hasFrame(vidObj))
    % %    vidObj.CurrentTime=time
    %    frame = readFrame(vidObj);
    %    imresize(frame,[64 64])
    %    imshow(frame);
    %    title(sprintf('Current Time = %.3f sec', vidObj.CurrentTime));
    %    pause(1/vidObj.FrameRate);
    
    %serialize image data
    data=image(:);
    %convert data to bits
    b = de2bi(data,'left-msb',8)';%converting to binary(column vector) where eight bits mean a number
    bits=b(:);
    txData=double(bits);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%channel%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    modData = bpskModulator(txData);
    %figure(1);
    %scatterplot(modData);
    rxSig = awgn(modData,10);                % Pass through AWGN
    rxData = bpskDemodulator(rxSig);       % Demodulate
    %figure(2);
    %scatterplot(rxData);
    errorStats = errorRate(txData,rxData); % Collect error stats
    fprintf('Error rate = %f\nNumber of errors = %d\n',errorStats(1), errorStats(2));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%transmission%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %convert bits to group of 8
    bits=reshape(bits,8,[])';
    
    %converting bits to image value
    data = bi2de(bits,'left-msb')';%converting to binary(column vector) where eight bits mean a number
  
    %making the image array
    image=reshape(image,64,64,3);
    
    % time=1:0.1:10;
    % path="cat.mp4";
    % vidObj = VideoReader(path);
    
    if eof
        close(v);
    else
    % for i = time
    % vidObj.CurrentTime=i
    % frame = readFrame(vidObj);
    %imshow(frame);
    % frame=imresize(frame,[64 64]);
    % imshow(frame);
    % size(frame);
        frame= im2frame(image);
        writeVideo(v,frame);
    end
end
close(v);


