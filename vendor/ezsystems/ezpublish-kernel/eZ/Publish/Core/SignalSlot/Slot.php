<?php
/**
 * File containing the SignalDispatcher class
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 * @version 2014.07.0
 */

namespace eZ\Publish\Core\SignalSlot;

/**
 * A Slot can be assigned to receive a certain Signal.
 *
 * @internal
 */
abstract class Slot
{
    /**
     * Receive the given $signal and react on it
     *
     * @param Signal $signal
     *
     * @return void
     */
    abstract public function receive( Signal $signal );
}
