classdef nnmulbytwo < nntest
  methods (Test)

    function basic(test)
      batchSize = 10 ;
      x = test.randn([5 5 3 batchSize]) ;
      y = vl_nnmulbytwo(x) ;

      % check derivatives with numerical approximation
      dzdy = test.randn(size(y)) ;
      derInputs = vl_nnmulbytwo(x,dzdy) ;
      dzdx = derInputs{1} ;
      test.der(@(w) vl_nnmulbytwo(x), dzdy, 1e-5*test.range) ;
    end

  end
end
