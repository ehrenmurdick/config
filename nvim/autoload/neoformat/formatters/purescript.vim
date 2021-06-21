function! neoformat#formatters#purescript#enabled() abort
  return ['purty']
endfunction

function! neoformat#formatters#purescript#purty() abort
  return {
       \ 'exe': 'purty',
       \ 'args': ['--dynamic']
       \ }
endfunction
