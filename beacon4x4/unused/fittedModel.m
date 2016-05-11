function z=fittedModel(k)

am=referenceDifference(k);
[xData, yData, zData] = prepareSurfaceData( 1:size(am,2), 1:size(am,1), am );
ft = fittype( 'poly32' );
[fitresult, ~] = fit( [xData, yData], zData, ft, 'Normalize', 'on' ); 
z=fitresult;
end

