load snowfalls

% Extract data for 2014/15 winter and for everything else until then
pre2015 = (t <= datetime(2014,6,21));
snowPre2015 = snow(pre2015);
snow2015 = snow(~pre2015);
% Extract data for the infamous winter of 1977/78
blizz = isbetween(t,datetime(1977,6,22),datetime(1978,6,21));
snow1978 = snow(blizz);

% Define a function that calculates the maximum total value in n
% consecutive elements of the array x, for n from 1 to nmax
nmax = 180;
maxXinNdays = @(x) arrayfun(@(n) max(conv(x,ones(n,1))),1:nmax);

% Use the function to compare snowfall totals
figure
semilogx(maxXinNdays(snowPre2015))
hold on
semilogx(maxXinNdays(snow2015))
semilogx(maxXinNdays(snow1978))
xlim([1 200])

% Annotate the graph
xlabel('Number of days')
ylabel('Total snowfall (in)')
title('Max total snowfall in an n-day period')
legend('pre-2015 record','2015','1978','Location','southeast')
