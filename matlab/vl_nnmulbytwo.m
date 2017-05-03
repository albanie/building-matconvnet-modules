function y = vl_nnmulbytwo(x, varargin)
%VL_NNMULBYTWO multiplies inputs by two
%   Y = VL_NNMULBYTWO(X) is an extremely exciting function, which
%   multiplies input arrays by the scalar value two. 
%
%   DX = VL_NNMULBYTWO(X, DY) computes the derivatives of
%   the multiplication operation. DX has the same dimensions as X. 

% check for derivatives in a way that is compatible with autonn
if ~isempty(varargin) && ~ischar(varargin{1}) 
  dzdy = varargin{1} ;
  varargin(1) = [] ;
else
  dzdy = [] ;
end

if isempty(dzdy)
    % forward direction
    y = x * 2 ;
else
    % backward direction
end
