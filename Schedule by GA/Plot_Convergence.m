function Plot_Convergence(ave,best)
   %axes(handles.axes2);
   hold on; axis xy; grid on;
   axis([0 size(ave,2) min(ave)-0.01 max(best)+0.01]);
   plot(ave,'rs','MarkerSize',2)
   plot(best,'*b','MarkerSize',2)
   legend('average','best')
   %guidata(hObject, handles)
end