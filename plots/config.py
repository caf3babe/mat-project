def load(filename):
  from yaml import load
  from types import SimpleNamespace
  try:
    from yaml import CLoader as Loader
  except ImportError:
      from yaml import Loader
  config_file = open(filename, 'r')
  config = load(config_file, Loader=Loader)
  return RecursiveNamespace(**config)

class RecursiveNamespace: 
  @staticmethod
  def map_entry(entry):
    if isinstance(entry, dict):
      return RecursiveNamespace(**entry)
    return entry

  def __init__(self, **kwargs):
    for key, val in kwargs.items():
      if type(val) == dict:
        setattr(self, key, RecursiveNamespace(**val))
      elif type(val) == list:
        setattr(self, key, list(map(self.map_entry, val)))
      else: 
        setattr(self, key, val)
