function out = phasorCompare(numSamples,cellMat)

phasorGroups = cell(numSamples,1);
if numSamples ~= 1
    F1 = figure;
    th = linspace(0,pi,100);
    x = 0.5*cos(th) + 0.5;
    y = 0.5*sin(th);
    plot(x,y,'k','LineWidth',2)
    xlim([0 1]),ylim([0 0.6])
    hold on
    set(F1,'visible','off')
end
for n = 1:numSamples
    if isempty(cellMat)
        folder = uigetdir();
        asc_list = dir([folder,'/*phasor_G.asc']);
        asc_n = length(asc_list);
        phFold = cell(asc_n,1);
        for i = 1:asc_n
            fname = [folder,'/',asc_list(i).name];
            %
            %
            phFile = phasor(fname,0,0,2);
            %
            %
            phFold{i} = phFile;
        end
        phFold = cell2mat(phFold);
        phasorGroups{n} = phFold;
        if numSamples > 1
            scatter(phFold(:,1),phFold(:,2),2)
            plot(nanmean(phFold(:,1)),nanmean(phFold(:,2)),'*','MarkerSize',14,'LineWidth',4)
            if n == numSamples
                set(F1,'visible','on')
                hold off
            end
        end
    else
        phasorGroups = cellMat;
        phFold = phasorGroups{n};
        scatter(phFold(:,1),phFold(:,2),2)
        plot(nanmean(phFold(:,1)),nanmean(phFold(:,2)),'k*','MarkerSize',14,'LineWidth',4)
        if n == numSamples
            set(F1,'visible','on')
            hold off
        end
    end
end
if isempty(cellMat)
    out = phasorGroups;
else
    out = '';
end

