function delta = computeInfoChange(model, add)

% COMPUTEINFOCHANGE Compute the information change associated with each point.

% IVM

if nargin < 2
  add = 1;
end

if add
  switch model.selectionCriterion
   case 'entropy'
    
    delta = -.5*sum(log2(1-model.varSigma(model.J, :).* ...
		     model.nu(model.J, :)), 2);
   otherwise
    error(['Selection criterion ' model.selectionCriterion ' not yet implemented'])
  end
else
  
  switch model.selectionCriterion
   case 'entropy'
    delta = -.5*sum(log2(1-model.varSigma(model.I, :).*model.beta(model.I, ...
						  :)), 2);
   otherwise
    error(['Selection criterion ' model.selectionCriterion ' not yet implemented'])
    
  end
end