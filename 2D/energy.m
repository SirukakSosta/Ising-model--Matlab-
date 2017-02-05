function en = energy(grid)

 global N J B;
       
        %%% 4gonies plegmatos
%   k11=-J*(grid(1,1)*(grid(2,1)+grid(1,2)+grid(N,1)+grid(1,N)))-B*grid(1,1);
%              kN1=-J*(grid(N,1)*(grid(N-1,1)+grid(N,2)+grid(N,N)+...
%                 grid(1,1)))-B*grid(N,1);
%              k1N=-J*(grid(1,N)*(grid(1,N-1)+grid(2,N)+grid(N,N)+...
%                 grid(1,1)))-B*grid(1,N);
%              kNN=-J*(grid(N,N)*(grid(N-1,N)+grid(N,N-1)+grid(1,N)+...
%                 grid(N,1)))-B*grid(N,N);
%             k=k11+kN1+k1N+kNN;
    k=0;
          %perimetros plegmatos
        for i=2:N-1    
           k=k-J*(grid(i,1)*(grid(i-1,1)+grid(i,2)+grid(i+1,1)+grid(i,N))+...
             grid(i,N)*(grid(i-1,N)+grid(i,1)+grid(i+1,N)+grid(i,N-1)))+...
              grid(1,i)*(grid(1,i+1)+grid(1,i-1)+grid(2,i)+grid(N,i))+...
              grid(N,i)*(grid(N,i+1)+grid(N,i-1)+grid(N-1,i)+grid(1,i))-...
              B*grid(i,1)-B*grid(i,N)-B*grid(1,i)-B*grid(N,i);       
          
        end
        %BC
%            for i=1:N
%            
%            grid(1,i)=grid(N,i);
%            grid(2,i)=grid(N-1,i);
%            grid(i,1)=grid(i,N);
%            grid(i,2)=grid(i,N-1);
%            
%            
%            end
           
        %%esoterikos pinakas
     for i=2:N-1
            for j=2:N-1
              
               k=k-J*(grid(i,j)*(grid(i+1,j)+grid(i-1,j)+grid(i,j+1)+...
                grid(i,j-1)))-B*grid(i,j);
            end
       end
   en=k;  
        
return;
end
