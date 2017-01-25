{% if data['id'] != salt['grains.get']('fqdn') and data['fun'].startswith('state') %}
{% set STATUS = "SUCCESS" if data['retcode'] == 0 else "FAILED" %}
{% set DATE = data['_stamp'] %}
{% set COMMAND = "%s %s" % (data['fun'], " ".join(data['fun_args'])) %}
{% set JID = data['jid'] %}

log finished job:
  local.cmd.run:
    - tgt: {{ data['id'] }}
    - arg:
      - "echo {{ DATE }} [{{ JID }}] {{ COMMAND }}: {{ STATUS }} >> /var/log/salt/jobs.log"
{% endif %}