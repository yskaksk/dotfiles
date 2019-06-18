setlocal expandtab
setlocal shiftwidth=4
setlocal tabstop=4

"imap <buffer> aaa \alpha<tab>
"imap <buffer> bbb \beta<tab>
"imap <buffer> ggg \gamma<tab>
"imap <buffer> ddd \delta<tab>
"imap <buffer> eee \epsilon<tab>
"imap <buffer> ppp \pi<tab>
"imap <buffer> sss \sigma<tab>
"
"imap <buffer> AAA \Alpha<tab>
"imap <buffer> BBB \Beta<tab>
"imap <buffer> GGG \Gamma<tab>
"imap <buffer> DDD \Delta<tab>
"imap <buffer> EEE \Epsilon<tab>
"imap <buffer> PPP \Pi<tab>
"imap <buffer> SSS \Sigma<tab>


let b:ale_linters = {'julia' : ['languageserver']}
let b:cursorword = 1
