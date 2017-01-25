{% if data['fun'].startswith('state') %}
{% set STATUS = "TRIGGER" %}
{% set DATE = data['_stamp'] %}
{% set COMMAND = "%s %s" % (data['fun'], " ".join(data['arg'])) %}
{% set JID = data['jid'] %}

log started job:
  local.cmd.run:
    - tgt: {{ data['tgt'] }}
    - expr_form: {{ data['tgt_type'] }}
    - arg:
      - "echo {{ DATE }} [{{ JID }}] {{ COMMAND }}: {{ STATUS }} >> /var/log/salt/jobs.log"
{% endif %}