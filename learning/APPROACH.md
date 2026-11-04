# Abordagem

Como o Cloudlab ataca o objetivo descrito em [IDEA.md](IDEA.md): aprender cloud e segurança construindo e protegendo infraestrutura.

## Visão geral

Tudo é feito em **uma conta AWS própria**, com Terraform, e vive neste repositório. Cada laboratório é uma pasta independente que pode ser criada e destruída sem afetar as outras.

```
você ──► Terraform (código) ──► AWS (recursos)
                 │
                 ├─ plan: mostra o que vai mudar
                 ├─ apply: cria ou altera
                 └─ destroy: remove tudo
```

Fluxo de cada laboratório:

1. Entender o conceito e, se for novo, fazer **uma vez pelo console** para ver como as peças se encaixam.
2. Escrever o mesmo em Terraform.
3. Ler o `terraform plan` linha por linha antes de aplicar.
4. Rodar um scanner de segurança e entender cada alerta.
5. Documentar o que aprendeu e o que errou na nota da etapa.
6. Rodar `terraform destroy`.

## Por que AWS

É o provedor com mais material de estudo e mais vagas, e os conceitos (IAM, rede virtual, armazenamento, logs) se transferem para Azure e GCP. A escolha pode ser revista depois da etapa 3.

## Por que Terraform

É o padrão de mercado para IaC. Na prática se escreve pouco código do zero: reaproveitam-se módulos e se revisa muito. Por isso o foco é **saber ler e revisar** Terraform, não decorar a sintaxe. Mesmo assim, o primeiro código de cada etapa é escrito à mão, para o entendimento ficar sólido.

## Estrutura de código

Cada laboratório fica em `labs/NN-name/`, com seus próprios arquivos Terraform e um `README.md` curto (o que foi construído, o que foi aprendido, que erro foi cometido). O estado do Terraform é **local** no início; backend remoto entra na etapa opcional.

## Segurança do próprio laboratório

- MFA na conta root, e a root não é usada no dia a dia.
- Alerta de orçamento configurado antes de qualquer recurso.
- Nenhuma chave de acesso, segredo ou arquivo `.tfstate` vai para o Git.
- No CI, a autenticação com a AWS usa OIDC, sem chaves de longa duração.
- Todo laboratório termina com `terraform destroy`.

## Limites assumidos

- O laboratório é para estudo: não substitui revisão de segurança nem arquitetura de produção.
- Scanners de IaC encontram erros de configuração conhecidos, mas não pegam tudo e geram falsos positivos; o objetivo é aprender a interpretá-los.
- Ambientes vulneráveis de propósito só rodam em conta própria e isolada, e são destruídos ao fim.
- Custos podem acontecer mesmo com cuidado; o alerta de orçamento é a rede de proteção, não uma garantia.
