" Initialization of variables {{{
" Check if deceleration is enabled.
let g:accelerated_jk_enable_deceleration = get(g:, 'accelerated_jk_enable_deceleration', 0)
" let g:accelerated_jk_acceleration_limit = get(g:, 'accelerated_jk_acceleration_limit', 150)
let g:accelerated_jk_acceleration_limit = get(g:, 'accelerated_jk_acceleration_limit', 250)

" Acceleration rate.
"   - Index + 1 represents steps of j/k mappings.
if !exists("g:accelerated_jk_acceleration_table")
    " let g:accelerated_jk_acceleration_table = [7,12,17,21,24,26,28,30]
    let g:accelerated_jk_acceleration_table = [7,12,17,21,25,29,32,35]
endif


" Reset speed if 1 second has passed.
" If deceleration is used, default deceleration is set.
"   - Customizing this table is recomended because checking a gap of time
"     is affected by OS's key repeat setting and other factors.
"   - Table is constructed of arrays having two elements.
"     - first element:  elapsed time after last j/k typed.
"     - second element: count to decelerate which is used in acceleration
"       table.
if !exists("g:accelerated_jk_deceleration_table")
    if g:accelerated_jk_enable_deceleration
        let g:accelerated_jk_deceleration_table =
                    \ [[200, 3], [300, 7], [450, 11], [600, 15], [750, 21], [900, 9999]]
    else
        let g:accelerated_jk_deceleration_table = [[150, 9999]]
    endif
endif
"}}}

" Default mappings {{{
" Time driven acceleration
noremap <silent><Plug>(accelerated_gj) :<C-u>call accelerated#time_driven#command('gj')<CR>
noremap <silent><Plug>(accelerated_gk) :<C-u>call accelerated#time_driven#command('gk')<CR>
noremap <silent><Plug>(accelerated_j)  :<C-u>call accelerated#time_driven#command('j')<CR>
noremap <silent><Plug>(accelerated_k)  :<C-u>call accelerated#time_driven#command('k')<CR>
noremap <silent><Plug>(accelerated_l)  :<C-u>call accelerated#time_driven#command('l')<CR>
noremap <silent><Plug>(accelerated_h)  :<C-u>call accelerated#time_driven#command('h')<CR>
" Position driven acceleration
nnoremap <silent><Plug>(accelerated_jk_gj_position) :<C-u>call accelerated#position_driven#command('gj')<CR>
nnoremap <silent><Plug>(accelerated_jk_gk_position) :<C-u>call accelerated#position_driven#command('gk')<CR>
nnoremap <silent><Plug>(accelerated_jk_j_position)  :<C-u>call accelerated#position_driven#command('j')<CR>
nnoremap <silent><Plug>(accelerated_jk_k_position)  :<C-u>call accelerated#position_driven#command('k')<CR>
"}}}
