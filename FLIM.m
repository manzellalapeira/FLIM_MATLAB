function [matrix, avg_Tm, std_Tm] = FLIM(analysis_type,photons_threshold,param)
%matrix = FLIM(analysis_type) takes data matrices from data acquired from FLIM and outputs graphs
%   and statistics
%
% Inputs:   analysis_type - you will select the analysis you want based on
%                what type of data you want to get in return
%                   'time' - this will calculate the Tm matrix based on the
%                       t1, t2, t3, a1, a2, a3 matrices
%           param - [tau folder ]                  
%
% Outputs:  matrix - contains the desired output matrix, the tm matrix, the
%               masked tm matrix using the photon counts as a mask, or both

switch lower(analysis_type)
        
    case 'time'
        tau = uigetfile({'*.asc';'*.asci'},'File Selector','MultiSelect','On');
        a_coef = uigetfile({'*.*';'*.asci'},'File Selector','MultiSelect','On');
        Tm = zeros(size(tau{1}));
        for i = size(tau)
            Tm = Tm + tau{i}.*a_coef{i};
        end
        matrix = Tm;
        avg_Tm = mean2(Tm);
        std_Tm = std2(Tm);
        
    case 'main'
        
        matrix = cell(2,1);
        % make the program get an input for tau and path
        if isempty(param) == 0
            tau = param(1);
            path = param(2);
        else
            [tau,path] = uigetfile({'*.asc';'*.asci'},'Tau File Selector','MultiSelect','On');
        end
        if iscell(tau) == 1
            if isempty(param) == 0
                a_coef = param(3);
            else
                a_coef = uigetfile({'*.*';'*.asci'},'Coefficient File Selector','MultiSelect','On');
            end
            name = tau{1,1};
            for j = 1:size(tau,2)
                tau{j} = dlmread([path,tau{j}]);
                a_coef{j} = dlmread([path,a_coef{j}]);
            end
            AT = zeros(size(tau{1}));
            A = zeros(size(tau{1}));
            for i = 1:size(tau,2)
                AT = AT + tau{1,i}.*a_coef{1,i};
                A = A + a_coef{1,i};
            end
            Tm = AT./A;
        else
            name = tau;
            tau = dlmread([path,tau]);
            Tm = tau;
        end
        
        Tm(isnan(Tm))=0;
        matrix{1} = Tm;
        
        min_photon = photons_threshold;
        %photon_count = dlmread([path,uigetfile({'*.asc';'*.asci'},'Select Photon Count File')]);
        photon_count = dlmread([path,name(1:end-6),'photons.asc']);
        max_photon = max(max(photon_count));
        
        disp(path)
        
        if max_photon < min_photon
            disp('The threshold for photon counts is greater than the photon counts for the pixel with highest photons.')
            avg_Tm = 0;
            std_Tm = 0;
        else
            if size(photon_count) ~= size(Tm)
                error('Size of the matrices do not match. Check your source files for errors.')
            end
  
            [r,c] = size(photon_count);
        
            for i = 1:r
                for j = 1:c
                    if photon_count(i,j) <= min_photon
                        photon_count(i,j) = 0;
                    else
                        photon_count(i,j) = 1;
                    end
                end
            end
        
            masked = Tm.*photon_count;
            matrix{2} = masked;
            avg_Tm = mean2(masked(masked~=0));
            std_Tm = std2(masked(masked~=0));
        end
end

