function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
% Return J (cost) and grad (gradient)
J = 0;
grad = zeros(size(theta));
%=============================================================
% hypothesis:
h = sigmoid(X*theta);

% theta_1 = theta;
% theta_1(1) = 0;
% J = 1/m * ( -y' * log(sigmoid(X*theta)) - (1-y)' * log(1 - sigmoid(X*theta))) + lambda/(2*m) * sum (theta_1 .* theta_1);
% grad = (X' * (sigmoid(X*theta)-y) + lambda .* theta_1)./ m;

% calculate initial cost:
J = (1/m)*sum(-y'.*log(h)-(1-y)'.*log(1-h)) + (lambda/(2*m))*(sum(theta.^2)-theta(1,1)^2);
grad(1,1) = (1/m)*sum((sigmoid(X*theta)-y).*X(:,1));
for i=2:length(theta)
grad(i,1) = (1/m)*sum((h)-y).*X(:, i)) + lambda*theta(i,1)/m;
end
% =============================================================

end
