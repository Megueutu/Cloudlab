# Roadmap

Cada etapa tem um **conceito** para entender, uma **entrega** no repositório e um **checkpoint** "explique de volta" em [notes/](notes/). Uma etapa só termina quando o checkpoint passa **e** a entrega funciona. Não há prazos: o que importa é entender. Regras de trabalho em [AGENTS.md](AGENTS.md).

Profundidade: vale ir fundo em IAM, redes (CIDR, subnets, rotas, firewall), logs e detecção, e em ler e revisar Terraform. Vale só conhecer por cima serviços de nicho, otimização de custo e arquiteturas de grande escala.

Tamanho: **P** (pequena), **M** (média), **G** (grande).

## Etapa 0: o terreno (P)

- [ ] **Conceito:** o que é cloud (IaaS, PaaS, SaaS), regiões e zonas de disponibilidade, modelo de responsabilidade compartilhada, como a cobrança funciona.
- [ ] **Entrega:** conta AWS criada, MFA na conta root, um usuário administrador para o dia a dia e alerta de orçamento ativo.
- [ ] **Checkpoint:** `notes/00-terrain.md`.

## Etapa 1: Linux e redes (G)

- [ ] **Conceito:** terminal, permissões, processos, SSH com chave; modelo TCP/IP, IP, CIDR e sub-redes, DNS, HTTP e TLS (conceito), firewall e NAT.
- [ ] **Entrega:** criar uma instância EC2 **pelo console**, acessá-la por SSH com chave, instalar um serviço simples e provar com `curl` e `ss` o que está aberto. Destruir ao final.
- [ ] **Checkpoint:** `notes/01-linux-networking.md`.

## Etapa 2: IAM (G)

- [ ] **Conceito:** usuários, grupos, roles, policies, `Allow` e `Deny`, menor privilégio, credenciais temporárias, MFA.
- [ ] **Entrega:** uma role com policy mínima assumida pela CLI, e a prova (com um acesso negado) de que ela não faz mais do que deveria.
- [ ] **Checkpoint:** `notes/02-iam.md`.

## Etapa 3: Terraform base (G)

- [ ] **Conceito:** `provider`, `resource`, `variable`, `output`, `data`, state, `plan`, `apply`, `destroy`, e como ler um plano.
- [ ] **Entrega:** `labs/01-s3-private`, um bucket S3 privado, criptografado e com bloqueio de acesso público, escrito à mão.
- [ ] **Checkpoint:** `notes/03-terraform-basics.md`.

## Etapa 4: VPC (G)

- [ ] **Conceito:** VPC, sub-redes públicas e privadas, route tables, internet gateway, NAT gateway, security groups e NACLs.
- [ ] **Entrega:** `labs/02-vpc`, uma VPC com sub-redes públicas e privadas em Terraform, com um diagrama em `docs/`.
- [ ] **Checkpoint:** `notes/04-vpc.md`.

## Etapa 5: computação segura (M)

- [ ] **Conceito:** EC2, AMIs, perfis de instância, acesso por SSM em vez de SSH aberto, endurecimento (hardening) básico.
- [ ] **Entrega:** `labs/03-ec2-hardened`, uma instância em sub-rede privada, sem porta de entrada aberta, acessada por SSM.
- [ ] **Checkpoint:** `notes/05-compute.md`.

## Etapa 6: logs e detecção (M)

- [ ] **Conceito:** CloudTrail, CloudWatch, GuardDuty, AWS Config; o que registrar e como transformar registro em alerta.
- [ ] **Entrega:** `labs/04-logging`, trilha de auditoria ativa e pelo menos um alerta funcionando (por exemplo, uso da conta root).
- [ ] **Checkpoint:** `notes/06-logging-detection.md`.

## Etapa 7: DevSecOps (M)

- [ ] **Conceito:** pipelines, `terraform fmt` e `validate`, scanners de IaC (`tfsec`, `checkov` ou `trivy`), autenticação por OIDC.
- [ ] **Entrega:** workflow no GitHub Actions que valida e escaneia o Terraform a cada commit, sem chaves de longa duração.
- [ ] **Checkpoint:** `notes/07-devsecops.md`.

## Etapa 8: ataque e defesa (G)

- [ ] **Conceito:** caminhos comuns de ataque em cloud (escalada de privilégio por IAM, bucket exposto, credencial vazada) e como detectá-los.
- [ ] **Entrega:** explorar um ambiente vulnerável de propósito (CloudGoat ou flAWS), corrigir a falha e mostrar o alerta que a detectaria.
- [ ] **Checkpoint:** `notes/08-attack-defense.md`.

## Etapa 9 (opcional): escala (G)

- [ ] **Conceito:** módulos, backend remoto com bloqueio de state, múltiplas contas e AWS Organizations.
- [ ] **Entrega:** refatorar os laboratórios em módulos reutilizáveis e mover o state para um backend remoto.
- [ ] **Checkpoint:** `notes/09-scale.md`.
