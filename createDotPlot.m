function dotPlot = createDotPlot(comparison,window,mistake)
%Function using comparison matrix of sequences and parameter such as window size
%and mistake threshold. In loop of window size checks values from comparison.
%There is counting for cells that equal 1. If counter is within acceptable
%limits (equal or more than differnece between windows size and mistake)
%then new matrix's cell equal 1.
counter = 0;
[size1, size2] = size(comparison)
dotPlot = zeros(size1,size2);
m = size2 - (window-1);
n = size1 - (window-1);

for x=1:n
    for y=1:m
        for z = 1:window
            %counting cells that are equal 1
            if(comparison(x+z-1,y+z-1) == 1)
                counter = counter+1;
            end
        end
        %checking if counter exceeds acceptance limit
        %and creating new data for plot
        if (counter >= (window-mistake))
            for z = 1:window
                dotPlot(x+z-1,y+z-1) = 1;
            end
        end
        %restarting value of counter
        counter = 0;
    end
end



figure;
spy(dotPlot); 
chart = gca; 
chart.XAxisLocation = 'top'; 
chart.Title.String = 'Dot plot'; 
xlabel('First Sequence') 
ylabel('Second Sequence')
saveas(gcf,'dotPlot.png'); 