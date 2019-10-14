function []=Plot_Graph(G,n)
    hold on;
    axis xy;
    axis equal;
    axis([-10 10 -10 10])
    for i=1:n
       x(i)=-8*sin(i*(2*pi/n));
       y(i)=8*cos(i*(2*pi/n));
       r=0.5;
       plot(x(i),y(i),'O','markersize',15,'LineWidth',2);
       text(x(i)-0.1,y(i),num2str(i),'FontSize',8,'FontWeight','Bold');       
    end
    for i=1:n-1
       for j=i+1:n
          if(G(i,j)==1)
             plot([x(i) x(j)],[y(i) y(j)],'LineWidth',1.45) 
          end
       end
    end
end