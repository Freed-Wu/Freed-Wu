"""This is my mostly used functions."""


class My:
    """My most used functions."""

    @staticmethod
    def params_M(net, requires_grad: bool = True):
        """Get the parameters of network.

        :param net:
        :param requires_grad:
        :type requires_grad: bool
        """
        s: int = 0
        for p in net.parameters():
            if requires_grad and p.requires_grad or not requires_grad:
                s += p.numel()
        return s / 1e6

    @staticmethod
    def flops_G(net, *args: int):
        """Get the FLOPs of network.

        :param net:
        :param args:
        """
        from fvcore.nn import FlopCountAnalysis
        import torch

        input = torch.zeros(1, *args)
        flops = FlopCountAnalysis(net, (input,))
        return flops.total() / 1e9, flops

    @staticmethod
    def register_forward_hook(net):
        """register_forward_hook.

        :param net:
        """
        net.register_forward_hook(My.hook)
        return net

    @staticmethod
    def hook(module, input, output):
        """Provide a hook function.

        :param module:
        :param input:
        :param output:
        """
        print(output.shape)

    @staticmethod
    def calc_batch_size(
        b1: int,
        m1,
        b2: int,
        m2,
        m_G: int = 24,
        b_wanted: int = 0,
        mem_safe=200,
    ):
        """Calculate the maximal batch size.

        :param b1:
        :type b1: int
        :param m1:
        :param b2:
        :type b2: int
        :param m2:
        :param m_G:
        :type m_G: int
        :param b_wanted:
        :type b_wanted: int
        :param mem_safe:
        """
        k = abs(b2 - b1) / abs(m2 - m1)
        m_rest_max = m_G * 1000 - max(m1, m2)
        b_max = max(b1, b2) + m_rest_max * k
        if b_wanted == 0:
            b = int(b_max // 8 * 8)
        else:
            b = b_wanted
        m_rest = (b_max - b) / k
        while m_rest < mem_safe:
            b -= 8
            m_rest = (b_max - b) / k
        return b, m_rest


my = My()
