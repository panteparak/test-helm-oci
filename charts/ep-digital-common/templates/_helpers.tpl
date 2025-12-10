{{/*
Expand the name of the chart.
*/}}
{{- define "ep-digital-common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "ep-digital-common.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ep-digital-common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ep-digital-common.labels" -}}
helm.sh/chart: {{ include "ep-digital-common.chart" . }}
{{ include "ep-digital-common.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "ep-digital-common.datadogLabels" -}}
{{- if .Values.datadog.enabled }}
tags.datadoghq.com/env: {{ .Values.datadog.env | quote }}
tags.datadoghq.com/service: {{ .Values.datadog.service | quote }}
tags.datadoghq.com/version: {{ .Values.datadog.version | quote }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ep-digital-common.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ep-digital-common.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ep-digital-common.serviceAccountName" -}}
{{- if .Values.serviceAccount.enabled }}
{{- default (include "ep-digital-common.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "ep-digital-common.namespace" -}}
{{- if .Values.namespaceOverride }}
{{- .Values.namespaceOverride }}
{{- else }}
{{- .Release.Namespace }}
{{- end }}
{{- end }}

{{- define "ep-digital-common.serviceAccountNamespace" -}}
{{ include "ep-digital-common.namespace" . }}
{{- end }}

{{- define "lbrace" }}{{"{{"}}{{- end }}
{{- define "rbrace" }}{{"}}"}}{{- end }}


{{/*

{{- define "ep-digital-common.valutInjectorWebServiceMode" -}}
vault.hashicorp.com/agent-inject-secret-config.json: "secret/data/projects/${gcp-project-id}/${gcp-k8s-cluster}/${application-name}-dev/configuration"
vault.hashicorp.com/agent-inject-template-config.json: |
    {{"{{"}} with secret "secret/data/projects/${gcp-project-id}/${gcp-k8s-cluster}/${application-name}-dev/configuration" -{{"}}"}} 
  {{"{{"}} .Data.data | toJSON {{"}}"}} 
{{"{{"}}- end {{"}}"}} 

vault.hashicorp.com/agent-inject-secret-server-ca.base64: "secret/data/projects/centralized-database/dev"
vault.hashicorp.com/agent-inject-template-server-ca.base64: |
  {{- with secret "secret/data/projects/centralized-database/dev" -}}
  {{- .Data.data.SSL_CA_CERT -}}
  {{- end }}
vault.hashicorp.com/agent-inject-secret-client-key.base64: "secret/data/projects/centralized-database/dev"
vault.hashicorp.com/agent-inject-template-client-key.base64: |
  {{- with secret "secret/data/projects/centralized-database/dev" -}}
  {{- .Data.data.SSL_CLIENT_KEY -}}
  {{- end }}
vault.hashicorp.com/agent-inject-secret-client-cert.base64: "secret/data/projects/centralized-database/dev"
vault.hashicorp.com/agent-inject-template-client-cert.base64: |
  {{- with secret "secret/data/projects/centralized-database/dev" -}}
  {{- .Data.data.SSL_CLIENT_CERT -}}
  {{- end }}

vault.hashicorp.com/secret-volume-path: "/app/configuration"
{{- end }}

{{- define "ep-digital-common.vaultInjectorPodAnnotations" -}}
{{ if .Values.vaultInjector.enabled }}
vault.hashicorp.com/agent-inject: "true"
vault.hashicorp.com/agent-init-first: "true"
vault.hashicorp.com/agent-pre-populate-only: "false"
vault.hashicorp.com/template-static-secret-render-interval: {{ .Values.datadog.staticSecretRenderInterval | default "24h"}}
vault.hashicorp.com/auth-path: {{ .Values.datadog.authPath | default "auth/${gcp-k8s-cluster}"}}
vault.hashicorp.com/log-level: {{ .Values.datadog.logLevel | default "info" }}
vault.hashicorp.com/role: *appName
vault.hashicorp.com/namespace: {{ include "ep-digital-common.namespace" . }}
{{- end }}
{{- end }}

*/}}


