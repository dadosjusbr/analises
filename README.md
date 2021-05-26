# Análises com dados do DadosJusBR

Código e reports de análises com os dados libertados pelo projeto. Os relatórios que já estão no ar estão em [https://dadosjusbr.github.io/analises/](https://dadosjusbr.github.io/analises/).

## Para gerar um csv com todos os dados que temos libertados

```
./src/lista_existentes.R
./src/fetch.sh
./src/transform_load.R
```

## Para desenvolver

Dados brutos vão em `dados/raw`, e prontos em `dados/ready`. Outros dados que nós criamos manualmente e usamos para criar o ready vão em `dados/input`. 

Código para obter dados (e colocá-los em `dados/raw`) e transformar dados (colocando-os e `dados/ready`), assim como funções reusáveis vão em `src/`. 

Relatórios que usam dados prontos (`dados/ready`) ficam em `reports/`. Coloque o html de versões para publicação em `docs/` e eles estarão disponíveis em https://dadosjusbr.github.io/analises/. Não coloque o html dos relatórios em `reports/`. 
