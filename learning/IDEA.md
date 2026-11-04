# A ideia

O Cloudlab é um **laboratório de infraestrutura em cloud**, feito para aprender arquitetura de cloud construindo coisas pequenas e reais, sempre com um olhar de segurança. Não é um produto: o valor está no que se aprende ao montar, quebrar, proteger e destruir cada laboratório.

## O objetivo

Entrar na área de cyber começando por **infraestrutura**. Quem entende como uma rede, uma conta e uma máquina são montadas sabe onde elas costumam falhar. Em cloud, as falhas mais comuns não são exploits sofisticados, e sim **configuração**:

- permissões de IAM amplas demais;
- buckets de armazenamento públicos por engano;
- portas abertas para o mundo inteiro (`0.0.0.0/0`);
- chaves de acesso esquecidas no código;
- ausência de logs, então ninguém percebe o incidente.

## Como cada laboratório funciona

Todo laboratório segue o mesmo ciclo:

1. **Construir:** criar a infraestrutura com Terraform.
2. **Proteger:** aplicar o princípio do menor privilégio, fechar o que não precisa estar aberto.
3. **Observar:** ligar logs e alertas para enxergar o que acontece.
4. **Atacar e corrigir:** quando fizer sentido, explorar a própria falha e consertar.
5. **Destruir:** `terraform destroy`. Laboratório que fica ligado custa dinheiro e aumenta a superfície de ataque.

## Conceitos que aparecem o tempo todo

- **Responsabilidade compartilhada:** o provedor cuida da nuvem em si; você cuida do que coloca nela.
- **Menor privilégio:** cada identidade recebe só o acesso de que precisa.
- **Defesa em profundidade:** várias camadas, de modo que uma falha não derrube tudo.
- **Infraestrutura como código (IaC):** a infraestrutura é descrita em arquivos versionados, revisáveis e repetíveis.
- **Imutabilidade e reprodutibilidade:** o que se cria por código pode ser recriado e destruído com o mesmo código.

## Dentro do escopo

- AWS, com o free tier e orçamento sempre monitorado.
- IAM, VPC, EC2, S3, logging e detecção.
- Terraform, GitHub Actions e scanners de segurança de IaC.
- Ambientes vulneráveis de propósito (CloudGoat, flAWS), usados só em conta própria.

## Fora do escopo

- Multi-cloud (Azure e GCP ficam para depois, se houver vontade).
- Kubernetes e containers em escala.
- Desempenho, alta disponibilidade e custo de nível de produção.
- Qualquer teste contra contas ou sistemas que não sejam seus.

## Como aprender com isso

Cada conceito acima vira uma etapa do [ROADMAP.md](ROADMAP.md), com uma entrega no repositório e um checkpoint em que você explica com as suas palavras. As regras de trabalho estão em [AGENTS.md](AGENTS.md).
