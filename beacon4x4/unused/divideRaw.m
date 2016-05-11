%% divide raw data into two
s4actual=s4(1:2:end,:);
s4train=s4(2:2:end,:);
training = input('Enter training set:');
if isempty(training)
          training = s4train;
end
actual = input('Enter actual set:');
if isempty(actual)
          actual = s4actual;
end