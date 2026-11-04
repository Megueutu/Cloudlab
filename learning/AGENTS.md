# AGENTS.md

Regras para quem trabalha neste repositório, pessoa ou ferramenta.

## Contexto

O Cloudlab é um projeto de estudo: aprender arquitetura de cloud e segurança construindo laboratórios de infraestrutura na AWS com Terraform. O objetivo principal é **entender**, não entregar rápido. Leia [IDEA.md](IDEA.md), [APPROACH.md](APPROACH.md) e [ROADMAP.md](ROADMAP.md) antes de começar.

## Commits

- Formato obrigatório: `tipo: mensagem`.
  - Certo: `feat: add private s3 bucket lab`, `fix: restrict ssh ingress`, `docs: add roadmap`.
  - Errado: `feat(vpc): add subnets`, `Feat: Add Subnets`, `added subnets`.
- Tipos aceitos: `feat`, `fix`, `refactor`, `perf`, `test`, `docs`, `style`, `build`, `ci`, `chore`, `revert`.
- **Sem escopo** entre parênteses.
- Sempre em **inglês** e **todo em minúsculo**, incluindo o tipo e a primeira palavra.
- Mensagem curta, no imperativo.
- **Atômicos**: um commit por unidade lógica. Nunca agrupe mudanças sem relação e nunca faça commits redundantes.

## Idioma

- Nomes de arquivos, pastas, código, recursos do Terraform, comentários e mensagens de commit: **inglês**.
- Documentação (`.md` de estudo e notas): **português**, com termos técnicos em inglês (`bucket`, `policy`, `security group`).
- O `README.md` da raiz fica em inglês.

## Segurança do laboratório

Estas regras valem sempre, para pessoa ou ferramenta:

- **Nunca** commitar chaves de acesso, segredos, `*.tfstate` ou `*.tfvars` com valores sensíveis.
- Nada de `0.0.0.0/0` em portas de administração (SSH, RDP) nem buckets públicos, a não ser que o laboratório seja exatamente sobre isso, esteja dito no `README.md` dele e seja destruído ao final.
- Menor privilégio em toda policy do IAM. Evitar `"*"` em `Action` e `Resource`.
- Testar só na **conta própria** do laboratório. Nunca contra contas ou sistemas de terceiros.
- Todo laboratório termina com `terraform destroy`.
- Nunca rodar `terraform apply` sem ler o `terraform plan` antes.

## Fronteira da IA

A IA é uma parceira de estudo, não a autora do núcleo do projeto.

**Pode fazer:**
- estrutura do repositório, `.gitignore`, CI e configuração;
- workflows do GitHub Actions e a configuração dos scanners;
- documentação, diagramas, formatação e organização;
- explicar conceitos, mensagens de erro e o resultado de um `plan`;
- revisar o Terraform escrito e apontar problemas de segurança, sem reescrevê-lo.

**Quem estuda escreve:**
- o Terraform de cada laboratório: recursos, policies do IAM, regras de rede e a lógica de segurança;
- os alertas e a lógica de detecção.

**Quando houver dificuldade:** a IA dá dicas e faz perguntas. Só mostra uma solução completa se for pedido explicitamente.

## Checkpoints

Cada etapa do [ROADMAP.md](ROADMAP.md) termina com um checkpoint do tipo "explique de volta":

1. Escreva em `learning/notes/` uma explicação com as suas palavras, sem copiar.
2. Quem revisa faz perguntas de aprofundamento até o entendimento ficar sólido.
3. A etapa só conta como concluída quando o checkpoint passa **e** a entrega funciona.

Arquivos de nota: `NN-topic.md` (nome em inglês, conteúdo em português), por exemplo `00-terrain.md`.

## Estrutura

```
.
├── AGENTS.md            aponta para este arquivo
├── README.md
├── learning/
│   ├── AGENTS.md        este arquivo
│   ├── IDEA.md          a ideia e os conceitos de cloud e segurança
│   ├── APPROACH.md      a abordagem técnica
│   ├── ROADMAP.md       etapas, entregas e checkpoints
│   └── notes/           explicações escritas por quem estuda
├── labs/                um laboratório por pasta, a partir da etapa 3
├── docs/                diagramas de arquitetura
└── .github/workflows/   CI, a partir da etapa 7
```
