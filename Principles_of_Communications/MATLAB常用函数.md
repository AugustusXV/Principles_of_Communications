# MATLAB常用函数

```matlab
%% floor
% 将输入的每个元素向下取整为不大于该值的最大整数。
```



```matlab
%% zeros	常用于初始化数组
Z = zeros(m, n);	% 生成一个 m × n 的全零矩阵
```



```matlab
%% 求数组的均值和方差	mean and var
% 定义一个数组
data = [1, 2, 3, 4, 5];

% 计算均值
mean_value = mean(data);

% 计算方差
variance_value = var(data);

% 输出结果
disp(['均值为: ', num2str(mean_value)]);
disp(['方差为: ', num2str(variance_value)]);
% 注：
mean_row = mean(data, 2); % 按行计算均值
var_row = var(data, 0, 2); % 按行计算方差
variance_population = var(data, 1); % 计算总体方差

```

```matlab
%% 异或运算
b = xor(a,c);
```

