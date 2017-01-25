%%1d ising tasos
%%N:number of atoms
clear all;
close all;
global N J B;
%% S monodiastato dianisma
%%energeia all/shs J, Eksoteriko mag pedio B
%%N o arithmos atomon, D o arithmos vimaton pros thermodinamiki isoropia
%%T_step to vima ths thermokrasias, T_0 h teleutea epanalipsi gia ther/ia 
J=1;
B=1;
N=400;
D=1500;
T_step=0.1;
T_0=12;
K=1;
S=zeros(1,N);
T=0;
%%dianismata gia na ginei to plot sto telos
M_Y=[];
T_X=[];
E_Y=[];
C_Y=[];
x_i=1;
 %%%%TYXEOS PROSANATOLISMOS SPIN%%%%%
%  NumberList = [-1 1];
%  for i=1:N
%     S(i)=NumberList(1 + floor(rand * length(NumberList)));
%  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Prosanatolismos Spin paralila - feromag%%%%%
 for i=1:N
     S(i)=1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
 while(T<T_0)
  Mav=0;
  E_s=0;
  E_sq=0; 
     for i=1:D
         %%dialekse tixea enn integer apo 1 eos N
          j=randi([1 N],1,1);
          %%enegia prin tin alagi spin
          E1=energy(S);
          %%Alakse to spin dokimastika
           S(j)=-S(j);
          %%ypologise enegia meta tin alagi spin
          E2=energy(S);
          %%diafora energeias ton 2 katastaseon
          DeltaE=E2-E1;
          %%Ypologise th pithanotita metavasis
          p=exp(-DeltaE./(K*T));
          %%%dimiourgise 100 times metaxu tou 0-1 kai dialekse mia
            r = 1.*rand(100,1);
            k=randi([1 100],1,1);
            R1=r(k);
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
             S(j)=-S(j);
            if p >= R1
                S(j)=-S(j);
                sprintf('To Spin alaxe') 
            else
                sprintf('To Spin DEN alaxe') 

            end

       
        Mav=Mav+sum(S)./N;
        E_s=E_s+energy(S);
%         E_sq=E_sq+E_s^2;
     end
   
   

   

Mav=Mav./D;
E_s=E_s./(3*D*N);
% C_Y(:,x_i)=(1./(K*(T^2)))*((E_sq./D)-E_s^2);
T_X(:,x_i)=T;
M_Y(:,x_i)=Mav;
E_Y(:,x_i)=E_s
T=T+T_step;
x_i=x_i+1;
 end      
sz = 20;
figure(1)
scatter(T_X,M_Y,sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
ylabel('magnetization per site');
xlabel('temperature');
title('Magnetization vs Temprature - 2D Ising ')
 figure(2)
scatter(T_X,E_Y,sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
ylabel('Energy per site');
xlabel('temperature');
title('Energy vs Temprature - 2D Ising');
%  figure(3)
% scatter(T_X,C_Y,sz,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5)
% ylabel('Thermoxoritikotita');
% xlabel('temperature');
% title('C - 2D Ising');
%  hold off;

 
