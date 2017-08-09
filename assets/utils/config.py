from configparser import ConfigParser

CONFIG_INT_KEYS = {
    'hadoop_max_nodes_count',
    'hadoop_ebs_volumes_count',
    'hadoop_ebs_volume_size',
    'spark_max_nodes_count',
    'spark_ebs_volumes_count',
    'spark_ebs_volume_size'
}


def read_config(config_path):
    parser = ConfigParser()
    parser.read(config_path)
    config = {}
    for section in parser.sections():
        for (config_key, config_value) in parser.items(section):
            config[config_key] = int(config_value) if config_key in CONFIG_INT_KEYS else config_value
    return config
