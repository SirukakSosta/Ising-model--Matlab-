%%%2d ising tasos
%%N:number of atoms
clear all;
close all;
global N J B;
%% grid -> didiastatos pinakas me spin up h down
T_X=[];
M_T=[];
M_Y=[];
E_Y=[];
C_Y=[];
l1=1;
J=1;
B=1;
N=40;
D=5000;
T_step=0.1;
T_0=20;
K=1;
grid=zeros(N);
hold on;
T=0;
 %%%Spin all up/ Ferromagnetism%%%%%
 for i=1:N
    for j=1:N
     grid(i,j)=1;
    end
end

 while(T<T_0)
  Mav=0;
  Em=0;
  E_sq=0;
 
     for i=1:D
         %%dialekse tixea duo integer apo 1 eos N
            j1=randi([2 N-1],1,1);
            j2=randi([2 N-1],1,1);
          %%enegia prin tin alagi spin
          E1=energy(grid);
          %%Alakse to spin dokimastika
           grid(j1,j2)=-grid(j1,j2);
          %%enegia meta tin alagi spin
          E2=energy(grid);
          DeltaE=E2-E1;
          if DeltaE >0
          %%Ypologise th pithanotita metavasis
          p=exp(-DeltaE./(K*T));
            r = 1.*rand(100,1);
            k=randi([1 100],1,1);
            R1=r(k);  
             grid(j1,j2)=-grid(j1,j2);
            if p >= R1
                grid(j1,j2)=-grid(j1,j2);
                sprintf('To Spin alaxe') 
            else
                sprintf('To Spin DEN alaxe') 

            end
          end
        m1=sum(grid)./N;
        Mav=Mav+sum(m1)./N;
         Em=Em+energy(grid);
%          E_sq=E_sq+Em^2;
     end
   
   
M_T(:,l1)=(1-(sinh(2*K./T))^(-4))^(1/8);
E_Y(:,l1)=Em./D;
T_X(:,l1)=T; 
M_Y(:,l1)=Mav./D;
% C_Y(:,l1)=(1./(K*(T^2)))*((E_sq./D)-Em^2);
T=T+T_step;

l1=l1+1;
if T>=2.2
    break
end
 end 
while(T<T_0)
   
    M_T(:,l1)=0;
    T_X(:,l1)=T;

    l1=l1+1;
    T=T+T_step;
    
end

 
 sz=5;
 figure(1)
%  scatter(T_X,M_Y,sz,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5)

ylabel('Magnetize per site');
xlabel('temperature');
title('Magnetize vs Temprature - 2D Ising - B=1');
figure(2)
 scatter(T_X,E_Y./(N*182),sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5)
plot(T_X,M_Y./(N*182),'-o')
ylabel('Energy per site');
xlabel('temperature');
title('Energy vs Temprature - 2D Ising - B=1');
figure(3)
plot(T_X,M_T,'-o')
ylabel('Magnetization per site');
xlabel('temperature');
title('Magnetization theory');

 
