function  drawPlot(dotPlot,n,m)
figure;
spy(dotPlot); 
chart = gca; 
xValues = round(linspace(1,m,10));
yValues = round(linspace(1,n,10));
xticks(xValues);
yticks(yValues);
chart.XAxisLocation = 'top'; 
chart.Title.String = 'Dot plot'; 
xlabel('First Sequence');
ylabel('Second Sequence');

saveas(gcf,'dotPlot.png');
end

