function en = energy(S)

 global N J B;
        k=-J*(S(1)*S(2)+S(N)*S(N-1))-B*(S(1)+S(N));
       for i=2:N-1
       
       k=k-J*2*S(i)*S(i+1)-B*S(i);
       
       end
   en=k;  
        
return;
end
