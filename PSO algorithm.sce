clc
clf
function z=f(x, y)
z=-(y+47)*sin(sqrt(abs(y+(x/2)+47)))-x*sin(sqrt(abs(x-(y+47))));
endfunction

xx=linspace(-530,530,513);
yy=linspace(-530,530,513);
contour(xx,yy,f,30);
xset("fpf"," ") 

wx=0.1*ones(50,1);
c1x=0.1*ones(50,1);
c2x=0.1*ones(50,1);

wy=0.1*ones(50,1);
c1y=0.1*ones(50,1);
c2y=0.1*ones(50,1);
//
vx=rand(50,1);
x=[grand(50,1,'unf',-512,512)];
p1x=rand(50,1);
p2x=rand(50,1);
vy=rand(50,1);
y=[grand(50,1,'unf',-512,512)];
p1y=rand(50,1);
p2y=rand(50,1);
z=feval(x,y,f)';
Cand=diag(z);
[a,b]=find(Cand==min(Cand));
min_x=x(a);
min_y=y(a);
Pix=x;
Pgx=zeros(50,1)+min_x;
Piy=y;
Pgy=zeros(50,1)+min_y;
Pg=min(Cand)
L=0;
L_max=50;
WW=0;

while (L<L_max)
p1x=rand(50,1);
p2x=rand(50,1);
p1y=rand(50,1);
p2y=rand(50,1);
x=x+wx.*vx+p1x.*c1x.*(Pix-x)+p2x.*c2x.*(Pgx-x);
y=y+wy.*vy+p1y.*c1y.*(Piy-y)+p2y.*c2y.*(Pgy-y);
for i=1:length(x) 
         if x(i)>512
            then x(i)=512;
         elseif x(i)<-512
            then x(i)=-512;
         else
              x(i)=x(i);
         end 
end
for i=1:1:length(y) 
     if y(i)> 512
        then y(i)=512;
     elseif y(i)< -512
        then y(i)=-512;
     else
       y(i)=y(i);
      end 
end
Cand1=diag(feval(x,y,f)); 
if min(Cand1)<Pg then 
        [a,b]=find(Cand1==min(Cand1));
        min_x=x(a);
        min_y=y(a); 
        Pgx=zeros(50,1)+min_x;
        Pgy=zeros(50,1)+min_y;
        Pg=min(Cand1);
        WW=WW+1
else
    L=L+1
end
for i=1:1:length(Cand1)
    if Cand1(i)<Cand(i)then
        Pix(i)=x(i);
        Piy(i)=y(i);
    else
        Pix(i)=Pix(i);
        Piy(i)=Piy(i);
        end
end
Cand=Cand1;
scatter(x,y,msizes=8,'black','fill');
end



