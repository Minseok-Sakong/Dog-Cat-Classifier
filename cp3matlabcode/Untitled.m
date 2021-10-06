x = linspace(-20,20);
y = -0.1*exp(-1*sqrt(-1)*9*(2*pi*x/40)/2)*(sin(10*(2*pi*x/40)/2)/sin((2*pi*x/40)/2));
plot((2*pi*x)/40,angle(y))