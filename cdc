<!DOCTYPE html>
<html lang="=en"
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1.0">
    <title>CDC_CDB</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'Montserrat','Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;

      background: #000000;  

      color: aquamarine;
        }

        img{
            width: 150px;
        }

        h1{
            padding: 10px;
            font-size: 1.5rem;
        }

        div{
            display: flex;
            flex-direction: column;
            margin-bottom: 1.6rem;
        }

        #botoes input{
            min-width: 300px;
            flex: 1;
            height: 50px;
            border-radius: 10px;
            font-size: 1.9rem;
        }

        #botoes input:hover{
            background-color: grey;
            font-size: 2rem;
        }

        header{
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        input{
            background-color: #000000;
            color: white;
            border-bottom: 1px solid greenyellow;
            border-right: 1px solid greenyellow;
            font-size: 1.2rem;
        }

        label{
            color: cadetblue;
        }
    </style>


</head>
<body>
    <header>
        <img src="imagens/banco.png" alt="Banco">
        <h1>Calculo CDB e CDC</h1>
    </header>
    <form id="formulario" action="#"
    
    <div>
        <label for="">Valor Investido            
        </label>
        <input id="cx-valor" type="number" placeholder="R$:">
      </div>

    <div>
        <label for="">Taxa(%)
        </label>
        <input id="cx-taxa" type="number" placeholder="Tava(%)">
    </div>

    <div>
        <label for="">Ano Saque
        </label>
        <input id="cx-ano" type="number" step="0.01" placeholder="Ano Saque">
    </div>

    <div>
        <label for="">Juros CDB
        </label>
        <input id="cx-juros" type="number" step="0.01" placeholder="Juros:">
    </div>

    <div>
        <label for="">Valor a receber
        </label>
        <input id="cx-Valor a Receber" type="number" step="0.01" placeholder="Valor a Receber">
    </div>

    <div>
        <label for="">Rendimento Percentual           
        </label>
        <input id="cx-Rendimento" type="number" step="0.01" placeholder="Rendimento">
    </div>

    <div id="botoes">
        <input type="reset" value="limpar">
        <input id="btn-calcular" onclick="clique_botao_calcular()" type="submit" value="Calcular" >
    </div>

</form>

<script>
    function main(){
    function clique_botao_calcular(){
        const cx_valor = document.getElementById('cx-valor')
        const cx_taxa = document.getElementById('cx-taxa')
        const cx_juros = document.getElementById('cx-juros')
        const cx_rendimento = document.getElementById('cx-Rendimento')   


    

  const juros_cdb = calcular_juros_cdb(capital_cdb, taxa_cdb, ano_saque_cdb)
  const valor_receber_cdb = capital_cdb + juros_cdb
  const rendimento_percentual_cdb = (juros_cdb / capital_cdb) * 100

  
  console.log('****** Resumo CDB ******')
  console.log(`Investimento : ${rs(capital_cdb)}`)
  console.log(`Ganho        : ${rs(juros_cdb)}`)
  console.log(`A Receber    : ${rs(valor_receber_cdb)}`)
  console.log(`Rendimento   : ${rendimento_percentual_cdb.toFixed(2)} %`)

  console.log('\n****** CDC ******')
 
  const capital_cdc = capital_cdb
  const taxa_cdc = Number(question('Taxa CDC % a.m.: '))
  const tempo_cdc = (ano_saque_cdb-2023) * 12 

  
  const juros_cdc = calcular_juros_cdc(capital_cdc, taxa_cdc, tempo_cdc)
  const valor_total_apagar = capital_cdc + juros_cdc
  const valor_parcela = valor_total_apagar / tempo_cdc
  const percentual_total = (juros_cdc / capital_cdc) * 100 

  
  console.log('****** Resumo CDC ******')
  console.log(`Valor CDC(Emp.): ${rs(capital_cdc)}`)
  console.log(`Total a Pagar  : ${rs(valor_total_apagar)}`)
  console.log(`Juros CDC      : ${rs(juros_cdc)}`)
  console.log(`CET %          : ${percentual_total.toFixed(2)} %`)
  console.log(`Parcelas       : ${tempo_cdc} x ${rs(valor_parcela)}`)

 
  const lucro_banco = juros_cdc - juros_cdb
  console.log('\n****** LUCRO DO BANCO ******')
  console.log(`Lucro: ${rs(lucro_banco)}`)


function calcular_juros_cdb(capital_cdb, taxa_cdb, ano_saque_cdb){
  const tempo = ano_saque_cdb - 2023
  const juros = juros_compostos(capital_cdb, taxa_cdb, tempo)
  return juros
}

function calcular_juros_cdc(capital_cdc, taxa_cdc, tempo_cdc){
  return juros_compostos(capital_cdc, taxa_cdc, tempo_cdc)
}

function juros_compostos(c, i, t){
  const montante = c * (1 + i/100)**t
  const juros = montante - c
  return juros
}


function rs(valor){
  const formatado = `R$ ${valor.toFixed(2)}`
  return formatado
}
    }
}
main()
        
    
</script>
</body>


</head>
