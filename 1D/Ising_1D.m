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
N=300;
D=2000;
T_step=0.1;
T_0=10;
K=1;
S=zeros(1,N);
T=0;
%%dianismata gia na ginei to plot sto telos
M_Y=[];
T_X=[];
E_Y=[];
E_T=[];
C_Y=[];
M_T=[];
x_i=1;
%%%Prosanatolismos Spin paralila - feromag%%%%%
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
 while(T<T_0)
     for i=1:N
     S(i)=1;
    end
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
          if DeltaE>0
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
          end
       
        Mav=Mav+sum(S)./N;
        E_s=E_s+energy(S);
%         E_sq=E_sq+E_s^2;
     end
   
 

co=cosh(B./T);
si=sinh(B./T);
M_T(:,x_i)=(si + si*co/sqrt((si^2)+exp(-4*J*B./T)))/(co + sqrt((si^2)+...
    exp(-4*J*B./T)));   

Mav=Mav./D;
E_s=E_s./(3*D*N);
T_X(:,x_i)=T;
M_Y(:,x_i)=Mav;
E_Y(:,x_i)=E_s;
E_T(:,x_i)=-tanh(1./T);
T=T+T_step;
x_i=x_i+1;
 end  
 plot(T_X,M_T,'-o')
sz = 20;
figure(1)
% plot(T_X,M_Y,'color','b');
 scatter(T_X,M_Y,sz,'MarkerEdgeColor',[0 .5 .5],...
               'MarkerFaceColor',[0 .7 .7],...
               'LineWidth',1.5)
ylabel('magnetization per site');
xlabel('temperature');
title('Magnetization vs Temprature - 1D Ising - B=0')

figure(2)
% plot(T_X,E_?,'color','b');
%  plot(T_X,E_Y,T_X,E_T,'--');
 scatter(T_X,E_Y,sz,'MarkerEdgeColor',[0 .5 .5],...
               'MarkerFaceColor',[0 .7 .7],...
               'LineWidth',1.5)
