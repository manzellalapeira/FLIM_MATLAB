function Rmat = LIRR_asc2ratmat(name)
% LIRR_asc2ratmat(name)
%
% Inputs:   name - the name of the asc file for NADH a2[%]

if name == 0 
    [nfile,path] = uigetfile('*.asc');
    nameNADH = fullfile(path,nfile);
else
    nameNADH = name;
    [path,nfile,sfx] = fileparts(name);
    nfile = [nfile,sfx];
end
%ffile = strrep(nfile,'NADH_a2[%]','FAD_a1[%]');
ffile = strrep(nfile,'750_a2[%]','890_a1[%]');
%chi750 = strrep(nfile,'NADH_a2[%]','NADH_chi');
chi750 = strrep(nfile,'750_a2[%]','750_chi');
%chi890 = strrep(nfile,'NADH_a2[%]','FAD_chi');
chi890 = strrep(nfile,'750_a2[%]','890_chi');
nameFAD = fullfile(path,ffile);
nameC750 = fullfile(path,chi750);
nameC890 = fullfile(path,chi890);
delimiterIn = ' ';
Dnadh = importdata(nameNADH,delimiterIn);
Dfad = importdata(nameFAD,delimiterIn);
Cnadh = importdata(nameC750,delimiterIn);
Cnadh(Cnadh==1000000) = 0;
Cfad = importdata(nameC890,delimiterIn);
Cfad(Cfad==1000000) = 0;
[x,y] = size(Dfad);
RR = zeros(x,y);
for i = 1:x
    for j = 1:y
        if Cnadh(i,j) > 1.5
            Dnadh(i,j) = 0;
        end
        if Cfad(i,j) > 1.5
            Dfad(i,j) = 0;
        end
        if Dfad(i,j) == 0 
            RR(i,j) = NaN;
        else
            RR(i,j) = Dnadh(i,j)/Dfad(i,j);
        end
    end
end

Rmat = RR;